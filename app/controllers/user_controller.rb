class UsersController < ApplicationController

  get '/sign_up' do
    erb :'/users/new'
  end
end
