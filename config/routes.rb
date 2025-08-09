Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  # Users
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/add_user", { :controller => "users", :action => "create" })
  post("/update_user/:path_username", { :controller => "users", :action => "update" })

  #Photos
  get("/photos", { :controller => "photos", :action => "index" })
  post("/insert_photo", { :controller => "photos", :action => "create" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })
  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
  post("/add_comment/", { :controller => "photos", :action => "add_comment" })
end
