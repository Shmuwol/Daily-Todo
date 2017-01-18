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
      redirect to "/lists/#{@list.id}"
    else
      flash[:notice] = "Something went wrong, task wasn't saved!"
      redirect to '/lists'
    end
  end

end
