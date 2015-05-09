class AcuteRehabilitationsController < ApplicationController
  before_action :set_acute_rehabilitation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @acute_rehabilitations = AcuteRehabilitation.all
    respond_with(@acute_rehabilitations)
  end

  def show
    respond_with(@acute_rehabilitation)
  end

  def new
    @acute_rehabilitation = AcuteRehabilitation.new
    respond_with(@acute_rehabilitation)
  end

  def edit
  end

  def create
    @acute_rehabilitation = AcuteRehabilitation.new(acute_rehabilitation_params)
    @acute_rehabilitation.save
    respond_with(@acute_rehabilitation)
  end

  def update
    @acute_rehabilitation.update(acute_rehabilitation_params)
    respond_with(@acute_rehabilitation)
  end

  def destroy
    @acute_rehabilitation.destroy
    respond_with(@acute_rehabilitation)
  end

  private
    def set_acute_rehabilitation
      @acute_rehabilitation = AcuteRehabilitation.find(params[:id])
    end

    def acute_rehabilitation_params
      params[:acute_rehabilitation]
    end
end
