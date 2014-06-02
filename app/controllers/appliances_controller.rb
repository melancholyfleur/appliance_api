class AppliancesController < ApplicationController

  def all_appliances
    appliances = Hash[ *Appliance.find_each(batch_size:100).map { |app| [app.name.split(".")[0].titleize, app.target_count] }.flatten ]
    render :json => appliances
  end

  def show
    @appliance = Appliance.find(params[:id])
  end
  
  def index
    @appliances = Appliance.all
  end

  def new
    @appliance = Appliance.new
  end

  def create
    @appliance = Appliance.new(appliance_params)
    if @appliance.save
      flash.notice = "New Ship Added Successfully"
      redirect_to @appliance
    else
      flash.alert = @appliance.errors.full_messages
      render "new"
    end
  end

  def edit
    @appliance = Appliance.find(params[:id])
  end

  def update
    @appliance = Appliance.find(params[:id])
    if @appliance.try(:update,appliance_params)
      flash.notice = "Data Updated Successfully"
      redirect_to @appliance
    else
      flash.alert = @appliance.errors
      render "edit"
    end
  end

  private

  def appliance_params
    params.require(:appliance).permit(:name, :customer)
  end

end
