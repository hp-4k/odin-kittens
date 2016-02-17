class KittensController < ApplicationController
  
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:info] = 'Created.'
      redirect_to @kitten
    else
      flash.now[:info] = 'Oops, there are errors in your form!'
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:info] = 'Updated.'
      redirect_to @kitten
    else
      flash.now[:info] = 'Oops, there are errors in your form!'
      render :edit
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:info] = "Deleted."
    redirect_to kittens_url
  end
  
  private
  
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
  
end
