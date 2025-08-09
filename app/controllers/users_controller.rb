class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order(:username)
    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.at(0)
    if @the_user == nil
      redirect_to("/")
    else
      render({ :template => "user_templates/show" })
    end
  end

  def create
    input_username = params.fetch("input_username")
    @the_user = User.new
    @the_user.username = input_username
    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User created successfully."})
    else
      redirect_to("/users", { :notice => "User failed to created successfully."})
    end
  end

  def update
    input_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => input_username })
    @the_user = matching_usernames.at(0)
    @the_user.username = params.fetch("input_username")
    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User created successfully."})
    else
      redirect_to("/users/#{@the_user.username}", { :notice => "User failed to created successfully."})
    end
  end
  
end
