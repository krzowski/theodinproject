class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
      format.xml { render xml: @kittens }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
      format.xml { render xml: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: 'New kitten, yay!' 
    else
      render action: 'new'
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'Kitten changed for better.' 
    else
      render action: 'edit'
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_url
  end

  private
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
