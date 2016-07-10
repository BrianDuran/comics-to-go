class FiguresController < ApplicationController
  before_action :set_figure, only: [:show, :edit, :update, :destroy]
  $figure_headers = ['character', 'name', 'release_date']
  @no_figures = false

  # GET /figures
  # GET /figures.json
  def index
    # sleep 2
    @figures = Figure.all
    if @figures.blank?
      no_figures_found
      render :new
    end
  end

  # GET /figures/1
  # GET /figures/1.json
  def show
  end

  # GET /figures/new
  def new
    @characters = Character.all
    @figure = Figure.new
  end

  # GET /figures/1/edit
  def edit
  end

  # POST /figures
  # POST /figures.json
  def create
    @figure = Figure.new(figure_params)

    respond_to do |format|
      if @figure.save
        no_figures_found
        format.html { redirect_to action: "index", notice: 'Figure was successfully created.' }
        format.json { render :show, status: :created, location: @figure }
      else
        format.html { render :new }
        format.json { render json: @figure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /figures/1
  # PATCH/PUT /figures/1.json
  def update
    respond_to do |format|
      if @figure.update(figure_params)
        format.html { redirect_to @figure, notice: 'Figure was successfully updated.' }
        format.json { render :show, status: :ok, location: @figure }
      else
        format.html { render :edit }
        format.json { render json: @figure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /figures/1
  # DELETE /figures/1.json
  def destroy
    @figure.destroy
    respond_to do |format|
      format.html { redirect_to figures_url, notice: 'Figure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    # @figures = Figure.all.order("#{params[:column]}" + " #{params[:direction]}")
    @figures = Figure.sort(params[:column], params[:direction])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_figure
      @figure = Figure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def figure_params
      params.require(:figure).permit(:character_id, :name, :release_date)
    end

    def no_figures_found
      @figure = Figure.new
      @no_figures = true
      @characters = Character.all
    end
end
