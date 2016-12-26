class UsersController < ApplicationController

  get '/sign_up' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(params)
    if user.save
      redirect to '/lists'
    else
      redirect to '/sign_up'
    end
  end
end
