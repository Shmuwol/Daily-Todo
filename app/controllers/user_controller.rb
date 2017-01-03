class UsersController < ApplicationController

  get '/sign_up' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:id] = user.id
      redirect to '/lists'
    else
      redirect to '/sign_up'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    redirect to "/lists" if logged_in?

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect to '/lists'
    else
      flash[:notice] = "Please provide a valid Username and Password"
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/welcome'
  end
end
