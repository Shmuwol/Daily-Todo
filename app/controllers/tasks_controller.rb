class TasksController < ApplicationController

  get '/lists/:id/tasks' do
    redirect_if_not_logged_in
    @list = current_user.lists.find(params[:id])
    @tasks = @list.tasks
    erb :'tasks/index'
  end

  post '/lists/:id/tasks' do
    redirect_if_not_logged_in
    @list = current_user.lists.find(params[:id])
    task = @list.tasks.build(name: params[:name])
    if task.save
      flash[:notice] = "Task was successfully saved!"
      redirect to "/lists/#{@list.id}"
    else
      flash[:notice] = "Something went wrong, task wasn't saved!"
      redirect to '/lists'
    end
  end

  get '/tasks' do
    @tasks = current_user.tasks
    erb :'tasks/show_all'
  end

  get '/tasks/:id/edit' do
    redirect_if_not_logged_in
    @task = current_user.tasks.find(params[:id])
    erb :'tasks/edit_task'
  end

end
