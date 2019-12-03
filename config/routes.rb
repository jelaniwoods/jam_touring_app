Rails.application.routes.draw do
  root :to => "tours#index"
  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tour resource:

  # CREATE
  get("/tours/new", { :controller => "tours", :action => "new_form" })
  post("/create_tour", { :controller => "tours", :action => "create_row" })

  # READ
  get("/tours", { :controller => "tours", :action => "index" })
  get("/tours/:id_to_display", { :controller => "tours", :action => "show" })

  # UPDATE
  get("/tours/:prefill_with_id/edit", { :controller => "tours", :action => "edit_form" })
  post("/update_tour/:id_to_modify", { :controller => "tours", :action => "update_row" })

  # DELETE
  get("/delete_tour/:id_to_remove", { :controller => "tours", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
