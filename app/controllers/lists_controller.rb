class ListsController < ApplicationController

  get '/lists' do
    redirect_if_not_logged_in
    @lists = current_user.lists.all
    erb :'lists/index'
  end

  get '/lists/new' do
    redirect_if_not_logged_in
    erb :'lists/new'
  end

  get '/lists/:id' do
    redirect_if_not_logged_in
    @list = current_user.lists.find_by_id(params[:id])
    erb :'lists/show'
  end

  post '/lists' do
    redirect_if_not_logged_in
    list = current_user.lists.create(params)
    if list.save
      redirect to '/lists'
    else
      redirect to '/lists/new'
    end
  end

  get '/lists/:id/edit' do
    redirect_if_not_logged_in
    @list = current_user.lists.find_by_id(params[:id])
    erb :'lists/edit_list'
  end

  patch '/lists/:id' do
    redirect_if_not_logged_in
    @list = current_user.lists.find_by_id(params[:id])
    @list.update(title: params[:title])
    if @list.save
      redirect to '/lists'
    else
      redirect to "/lists/#{@list.id}"
    end
  end

  delete '/lists/:id/delete' do
    redirect_if_not_logged_in
    list = current_user.lists.find_by_id(params[:id])
    list.destroy
    redirect to '/lists'
  end

end
