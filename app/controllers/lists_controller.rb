class ListsController < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

  get '/lists/new' do
    erb :'lists/new'
  end

  get '/lists/:id' do
    @list = List.find_by_id(params[:id])
    erb :'lists/show'
  end

  post '/lists' do
    list = List.create(params)
    if list.save
      redirect to '/lists'
    else
      redirect to '/lists/new'
    end
  end

  get '/lists/:id/edit' do
    @list = List.find_by_id(params[:id])
    erb :'lists/edit_list'
  end

  patch '/lists/:id' do
    @list = List.find_by_id(params[:id])
    @list.update(title: params[:title])
    if @list.save
      redirect to '/lists'
    else
      redirect to "/lists/#{@list.id}"
    end
  end

  delete '/lists/:id/delete' do
    list = List.find_by_id(params[:id])
    list.destroy
    redirect to '/lists'
  end

end
