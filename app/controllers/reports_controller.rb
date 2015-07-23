class ReportsController < ApplicationController

  REPORT_VIEWS_DIR = Dir.pwd + '/app/views/reports/report_views/'

  @@categories = %w(Patient Station National)

  @@stations = [
      {
          id: 1,
          name: 'Alpha'
      },
      {
          id: 2,
          name: 'Beta'
      },
      {
          id: 3,
          name: 'Omega'
      }
  ]

  @@reports = [
      {
          id: 1,
          name: 'Individual Veteran Report',
          description: 'Dates/Results of all AE, AR, OMR',
          entity: 'Patient',
          definition: lambda {
              |patient_id|

              # Standard data
              @patient = Patient.find_by(patient_id: patient_id)
              @title = 'Individual Veteran Report' # Can't figure out how to refer to the name/description on the parent hash
              @description = 'Dates/Results of all AE, AR, OMR'

              # Get all episodes
              @episodes = EpisodeOfCare.where(patient_id: patient_id).map { |eoc|

                # Get episode data from its table
                episode = ActiveRecord::Base.connection.execute("SELECT * FROM " + eoc[:actable_type].downcase + " WHERE id = " + String(eoc[:actable_id]))[0]

                # Add the cleaned episode name
                episode_name = eoc[:actable_type].sub('_', ' ')
                episode_name = episode_name[0..-2]
                episode[:actable_type] = episode_name.gsub(/\w+/) do |word|
                  word.capitalize
                end

                # Return
                episode
              }

              # Probably not neccessary
              opts = {
                  use_html_safe: false
              }

              Slim::Template.new(REPORT_VIEWS_DIR + @title.downcase.gsub(' ', '_') + '.slim', opts).render(self)
          }
      },
      {
          id: 2,
          name: 'Annual Eval Report',
          description: '#, % of AE in a given time period',
          entity: 'Station',
          definition: lambda { |station_id| '#, % of AE in a given time period for station ' + @@stations.select { |station| station[:id] == station_id }[0][:name] }
      },
      {
          id: 3,
          name: 'SCI Registry Total',
          description: 'list of all SCI patients by name, SSN, and station',
          entity: 'National',
          definition: lambda { 'list of all SCI Registry patients' }
      },
      {
          id: 3,
          name: 'Annual Eval Report',
          description: 'list of #, % of AE for each SCI Center in a given time period',
          area: 'AE',
          entity: 'National',
          definition: lambda { 'list of #, % of AE for each SCI Center' }
      },
      {
          id: 4,
          name: 'Acute Rehab Report',
          description: '#, % of AR in a given time period',
          entity: 'Station',
          definition: lambda { |station_id| '#, % of AR in a given time period for station ' + @@stations.select { |station| station[:id] == station_id }[0][:name] }
      },
      {
          id: 5,
          name: 'Acute Rehab Report',
          description: 'list of #, % of AR for each SCI Center in a given time period',
          entity: 'National',
          definition: lambda { 'list of #, % of AR for each SCI Center' }
      },
      {
          id: 6,
          name: 'OMR Report',
          description: '#, % of ORM in a given time period',
          entity: 'Station',
          definition: lambda { |station_id| '#, % of ORM in a given time period for station ' + @@stations.select { |station| station[:id] == station_id }[0][:name] }
      },
      {
          id: 7,
          name: 'OMR Report',
          description: 'list of #, % of OMR for each SCI Center in a given time period',
          entity: 'National',
          definition: lambda { 'list of #, % of OMR for each SCI Center' }
      },
      {
          id: 8,
          name: 'New Injury per station',
          description: 'List of all new injuries in a given time period',
          entity: 'Station',
          definition: lambda { |station_id| 'List of all new injuries in a given time period for ' + @@stations.select { |station| station[:id] == station_id }[0][:name] }
      },
      {
          id: 9,
          name: 'Annual Report per station',
          description: 'Outcomes of AE, AR, and OMR station specific',
          entity: 'Station',
          definition: lambda { |station_id| 'Outcomes of AE, AR, and OMR station specific for station ' + @@stations.select { |station| station[:id] == station_id }[0][:name] }
      }
  ]

  # Originally this would render a list of the different categories: (1) Patient, (2) Station, (3) National
  # currently we're only using National, so it's redirecting there. 
  def index()
    # @categories = @@categories
      redirect_to '/reports/entity/National/0/'
  end

  # If the report is entity-specific, make the user pick an entity
  def pick_entity()
    @entity = params[:entity]
    @query = params[:query]

    # '' reports are not entity specific
    if @entity == 'National'
      redirect_to '/reports/entity//0/'
    end

    # If a query parameter is provided, then try to populate the list
    if (@query)

      # Search for patients by name or id
      if @entity == 'Patient'
        @list = Patient.where(patient_id: params[:query])
        if @list.empty?
          @list = Patient.where("first_name LIKE :prefix OR last_name LIKE :prefix", prefix: "%#{params[:query]}%")
        end

      # Search for stations by name or id
      elsif @entity == 'Station'
        @list = @@stations.select { |station| String(station[:id]) == @query }
        if @list.empty?
          @list = @@stations.select { |station| station[:name].downcase.include? @query.downcase }
        end
      end
    end
  end

  def entity_reports()
    @entity = params[:entity]
    @entity_id = Integer(params[:entity_id])

    if @entity == 'Patient'
      @entity_name = Patient.find_by(patient_id: @entity_id)[:last_name]
    elsif @entity == 'Station'
      #begin
        @entity_name = @@stations.select { |station| station[:id] == @entity_id }[0][:name]
      #rescue
      #  @entity_name = ''
      #end
    elsif @entity == 'National'
      @entity_name = nil
    end

    @reports = @@reports.select { |report| report[:entity] == @entity }
  end

  def run_report()
    @entity = params[:entity]
    @entity_id = Integer(params[:entity_id])
    @entity_name = get_entity_name @entity, @entity_id
    report_id = Integer(params[:report_id])
    @report = @@reports.select { |report| report[:id] == report_id }
    if @report.empty?
      @data = 'No report found'
    else
      begin
        @data = @report[0][:definition].call @entity_id
      rescue ArgumentError
        @data = @report[0][:definition].call
      end
    end
  end

  def get_entity_name(entity, entity_id)
    if entity == 'Patient'
      Patient.find_by(patient_id: entity_id)[:last_name]
    elsif entity == 'Station'
      #begin
      @@stations.select { |station| station[:id] == entity_id }[0][:name]
      #rescue
      #  entity_name = ''
      #end
    elsif entity == 'National'
      nil
    end
  end

end
