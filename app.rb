require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './model/peep'
require './model/user'
load './data_mapper_setup.rb'

class Chitter < Sinatra::Base

  configure do
    use Rack::MethodOverride
    register Sinatra::Flash
    enable :sessions
  end

  get '/' do
    erb :create_user
  end

  post '/users/new' do
    new_user = User.create(:name => params[:name],
                      :email => params[:email],
                      :username => params[:username],
                      :password_digest => params[:password_digest])
    session[:user_id] = new_user.id
    redirect('/new')
  end

  get '/new' do
    erb :new
  end

  post '/peeps' do
    p Peep.create(:peep => params[:peep],
                  :created_at => Time.now,
                  :user_id => session[:user_id])
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  run! if app_file ==$0
end
