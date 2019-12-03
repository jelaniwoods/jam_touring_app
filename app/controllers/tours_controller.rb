class ToursController < ApplicationController
  before_action :current_user_must_be_tour_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_tour_user
    tour = Tour.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == tour.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @tours = Tour.all

    render("tour_templates/index.html.erb")
  end

  def show
    @location = Location.new
    @tour = Tour.find(params.fetch("id_to_display"))

    render("tour_templates/show.html.erb")
  end

  def new_form
    @tour = Tour.new

    render("tour_templates/new_form.html.erb")
  end

  def create_row
    @tour = Tour.new

    @tour.name = params.fetch("name")
    @tour.starts_on = params.fetch("starts_on")
    @tour.ends_on = params.fetch("ends_on")
    @tour.user_id = params.fetch("user_id")

    if @tour.valid?
      @tour.save

      redirect_back(:fallback_location => "/tours", :notice => "Tour created successfully.")
    else
      render("tour_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tour = Tour.find(params.fetch("prefill_with_id"))

    render("tour_templates/edit_form.html.erb")
  end

  def update_row
    @tour = Tour.find(params.fetch("id_to_modify"))

    @tour.name = params.fetch("name")
    @tour.starts_on = params.fetch("starts_on")
    @tour.ends_on = params.fetch("ends_on")
    

    if @tour.valid?
      @tour.save

      redirect_to("/tours/#{@tour.id}", :notice => "Tour updated successfully.")
    else
      render("tour_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @tour = Tour.find(params.fetch("id_to_remove"))

    @tour.destroy

    redirect_to("/users/#{@tour.user_id}", notice: "Tour deleted successfully.")
  end

  def destroy_row
    @tour = Tour.find(params.fetch("id_to_remove"))

    @tour.destroy

    redirect_to("/tours", :notice => "Tour deleted successfully.")
  end
end
