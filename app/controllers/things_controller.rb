class ThingsController < ApplicationController
  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)

    if @thing.save
      redirect_to @thing
    else
      render 'new'
    end
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @thing = Thing.find(params[:id])

    if @thing.update(thing_params)
      redirect_to @thing
    else
      render 'edit'
    end
  end

  def show
    @thing = Thing.find(params[:id])
  end

  def index
    @things = Thing.all
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    redirect_to things_path
  end

  private
  def thing_params
    params.require(:thing).permit(:name, :tried, :comment);
  end
end
