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
    if @list
      erb :'lists/show'
    else
      flash[:notice] = "Hands Off! This list does not belong to you!"
      redirect to '/lists'
    end
  end

  post '/lists' do
    redirect_if_not_logged_in
    list = current_user.lists.build(params)
    if list.save
      flash[:notice] = "List was successfully saved!"
      redirect to '/lists'
    else
      flash[:notice] = "Something went wrong, List wasn't saved!"
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
    if @list.update(title: params[:title])
      redirect to '/lists'
    else
      redirect to "/lists/#{@list.id}"
    end
  end

  delete '/lists/:id/delete' do
    redirect_if_not_logged_in
    list = List.find_by_id(params[:id])
    if list.user == current_user
      list.destroy
      redirect to '/lists'
    else
      flash[:notice] = "Stop touching other peoples stuff"
      redirect to '/lists'
    end
  end

end
