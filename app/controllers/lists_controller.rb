class ListsController < ApplicationController

  get '/lists' do
    erb :'lists/index'
  end

end
