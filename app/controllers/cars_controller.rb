class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show

  end

  def edit

  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
    @car.save!
  end

  def destroy
    @car.destroy
    redirect_to car_path(@car)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end


  def car_params
    params.require(:car).permit(:brand_model, :price, :category, :location, :description, photos: [])
  end

end
