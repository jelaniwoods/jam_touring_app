class LocationsController < ApplicationController
  def index
    @locations = Location.page(params[:page]).per(10)

    render("location_templates/index.html.erb")
  end

  def show
    @location = Location.find(params.fetch("id_to_display"))

    render("location_templates/show.html.erb")
  end

  def new_form
    @location = Location.new

    render("location_templates/new_form.html.erb")
  end

  def create_row
    @location = Location.new

    @location.name = params.fetch("name")
    @location.arrives_on = params.fetch("arrives_on")
    @location.departs_on = params.fetch("departs_on")
    @location.weather = params.fetch("weather")
    @location.exchange_rate = params.fetch("exchange_rate")
    @location.local_currency = params.fetch("local_currency")
    @location.tour_id = params.fetch("tour_id")

    if @location.valid?
      @location.save

      redirect_back(:fallback_location => "/locations", :notice => "Location created successfully.")
    else
      render("location_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_tour
    @location = Location.new

    @location.name = params.fetch("name")
    @location.arrives_on = params.fetch("arrives_on")
    @location.departs_on = params.fetch("departs_on")
    @location.weather = params.fetch("weather")
    @location.exchange_rate = params.fetch("exchange_rate")
    @location.local_currency = params.fetch("local_currency")
    @location.tour_id = params.fetch("tour_id")

    if @location.valid?
      @location.save

      redirect_to("/tours/#{@location.tour_id}", notice: "Location created successfully.")
    else
      render("location_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @location = Location.find(params.fetch("prefill_with_id"))

    render("location_templates/edit_form.html.erb")
  end

  def update_row
    @location = Location.find(params.fetch("id_to_modify"))

    @location.name = params.fetch("name")
    @location.arrives_on = params.fetch("arrives_on")
    @location.departs_on = params.fetch("departs_on")
    @location.weather = params.fetch("weather")
    @location.exchange_rate = params.fetch("exchange_rate")
    @location.local_currency = params.fetch("local_currency")
    @location.tour_id = params.fetch("tour_id")

    if @location.valid?
      @location.save

      redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
    else
      render("location_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_tour
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/tours/#{@location.tour_id}", notice: "Location deleted successfully.")
  end

  def destroy_row
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/locations", :notice => "Location deleted successfully.")
  end
end
