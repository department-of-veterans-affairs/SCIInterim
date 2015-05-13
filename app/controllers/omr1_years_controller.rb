class Omr1YearsController < ApplicationController
  before_action :set_omr1_year, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @omr1_years = Omr1Year.all
    respond_with(@omr1_years)
  end

  def show
    respond_with(@omr1_year)
  end

  def new
    @omr1_year = Omr1Year.new
    respond_with(@omr1_year)
  end

  def edit
  end

  def create
    @omr1_year = Omr1Year.new(omr1_year_params)
    @omr1_year.save
    respond_with(@omr1_year)
  end

  def update
    @omr1_year.update(omr1_year_params)
    respond_with(@omr1_year)
  end

  def destroy
    @omr1_year.destroy
    respond_with(@omr1_year)
  end

  private
    def set_omr1_year
      @omr1_year = Omr1Year.find(params[:id])
    end

    def omr1_year_params
      params[:omr1_year]
    end
end
