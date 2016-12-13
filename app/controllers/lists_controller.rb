class ListsController < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

  get '/lists/:id' do
    @list = List.find_by(params[:id])
    erb :'lists/show'
  end

  get '/lists/new' do
    erb :'lists/new'
  end

end
