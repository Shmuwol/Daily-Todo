require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "toodle_do"
    use Rack::Flash
  end

  get "/" do
    erb :index
  end

  get "/welcome" do
    if logged_in?
      redirect to '/lists'
    else
      erb :welcome
    end
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:notice] = "You must be logged it to do that."
        redirect to "/login"
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end
  end

end
