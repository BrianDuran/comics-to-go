class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  def index
    @comics = Comic.all
  end

  def show
  end

  def new
    @comic = Comic.new
  end

  def edit
  end

  def create
    @comic = Comic.new(comic_params)

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Your comic was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: 'Your comic was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
    end
  end

  private

    def set_comic
      @comic = Comic.find(params[:id])
    end

    def comic_params
      params.require(:comic).permit(:name, :release_date, :condition, :character_id)
    end
end
