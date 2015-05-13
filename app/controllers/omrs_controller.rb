class OmrsController < ApplicationController
  before_action :set_omr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @omrs = Omr.all
    respond_with(@omrs)
  end

  def show
    respond_with(@omr)
  end

  def new
    @omr = Omr.new
    respond_with(@omr)
  end

  def edit
  end

  def create
    @omr = Omr.new(omr_params)
    @omr.save
    respond_with(@omr)
  end

  def update
    @omr.update(omr_params)
    respond_with(@omr)
  end

  def destroy
    @omr.destroy
    respond_with(@omr)
  end

  private
    def set_omr
      @omr = Omr.find(params[:id])
    end

    def omr_params
      params[:omr]
    end
end
