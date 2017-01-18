class TasksController < ApplicationController

  get '/lists/:id/tasks' do
    redirect_if_not_logged_in
    @list = current_user.lists.find(params[:id])
    @tasks = @list.tasks
    erb :'tasks/index'
  end
  
end
