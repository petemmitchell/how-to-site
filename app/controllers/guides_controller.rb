class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  def index
    @guides = Guide.all
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
  end

  def show
    @guide
  end

  def edit
    @guide
  end

  def update
    if @guide.update(guide_params)
      redirect_to @guide, notice: 'Guide successfully created'
    else
      reder :edit
    end
  end

  def destroy
    @guide.destroy
    redirect_to guides_url, notice: 'Guide successfully destroyed'
  end

  private

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:name, :id)
  end
end
