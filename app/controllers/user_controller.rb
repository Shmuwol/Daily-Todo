class UsersController < ApplicationController

  get '/sign_up' do
    redirect_if_logged_in
    erb :'/users/new'
  end

  post '/users' do
    redirect_if_logged_in
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to '/lists'
    else
      flash[:notice] = user.errors.full_messages
      redirect to '/sign_up'
    end
  end

  get '/login' do
    redirect_if_logged_in
    erb :'users/login'
  end

  post '/login' do
    redirect_if_logged_in

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/lists'
    else
      flash[:notice] = "Please provide a valid Username and Password"
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect to '/welcome'
  end
end
