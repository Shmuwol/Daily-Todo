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
end
