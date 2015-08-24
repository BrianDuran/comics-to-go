class FiguresController < ApplicationController
  before_action :set_figure, only: [:show, :edit, :update, :destroy]

  def index
    @figures = Figure.all
  end

  def show
  end

  def new
    @figure = Figure.new
  end

  def edit
  end

  def create
    @figure = Figure.new(figure_params)

    respond_to do |format|
      if @figure.save
        format.html { redirect_to @figure, notice: 'Your comic was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @figure.update(comic_params)
        format.html { redirect_to @figure, notice: 'Your comic was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @figure.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
    end
  end

  private

    def set_figure
      @figure = Figure.find(params[:id])
    end

    def figure_params
      params.require(:figure).permit(:name, :release_date, :character_id)
    end
end
