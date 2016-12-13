class ListsController < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

  get '/lists/new' do
    erb :'lists/new'
  end

  get '/lists/:id' do
    @list = List.find_by(params[:id])
    erb :'lists/show'
  end

  post '/lists' do
    list = List.create(title: params[:title])
    if list.save
      redirect to '/lists'
    else
      redirect to '/lists/new'
    end
  end

end
