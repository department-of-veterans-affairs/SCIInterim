class Omr90DaysController < ApplicationController
  before_action :set_omr90_day, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @omr90_days = Omr90Day.all
    respond_with(@omr90_days)
  end

  def show
    respond_with(@omr90_day)
  end

  def new
    @omr90_day = Omr90Day.new
    respond_with(@omr90_day)
  end

  def edit
  end

  def create
    @omr90_day = Omr90Day.new(omr90_day_params)
    @omr90_day.save
    respond_with(@omr90_day)
  end

  def update
    @omr90_day.update(omr90_day_params)
    respond_with(@omr90_day)
  end

  def destroy
    @omr90_day.destroy
    respond_with(@omr90_day)
  end

  private
    def set_omr90_day
      @omr90_day = Omr90Day.find(params[:id])
    end

    def omr90_day_params
      params[:omr90_day]
    end
end
