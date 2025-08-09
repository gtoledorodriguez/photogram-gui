Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  # Users
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  #Photos
  get("/photos", { :controller => "photos", :action => "index"})
  post("/insert_photo", { :controller => "photos", :action => "create" })
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy"})

end
