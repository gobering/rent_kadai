class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を登録しました！"
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "物件を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
    
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :remarks, 
    nearest_stations_attributes: [:id, :route_name, :station_name, :time])
  end

end
