require 'sinatra'
require 'sinatra/reloader' if development?
require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/visits.sqlite3")

class User
  include DataMapper::Resource
  property :id,        Serial
  property :name,      String
end

class Session
  include DataMapper::Resource
  property :id,       Serial
  property :rec,      String
  property :created_at, DateTime
  
  def inspect
    "#{@id}\t#{@rec}\t#{@created_at}"
  end
end

DataMapper.finalize.auto_upgrade!

# set :views, File.join(File.dirname(__FILE__), 'views','models','db')
# set :run, false
# set :env, (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)

get '/' do
	@sessions = Session.all
	erb :index
end

get '/login' do
	erb :login
end

post '/after_login' do
  u = User.get(params[:login])
  if u
    Session.create! rec: u.name, created_at: Time.now
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/signup' do
	@user = User.new
	erb :signup
end

post '/after_signup' do
  if params[:login] = User.get(params[:login])
    flash[:alert] = 'User already exist'
  else
    @user = User.create! name: params[:login]
    Session.create! rec: @user.name, created_at: Time.now
    redirect '/signup'
  end
end

not_found do
	status 404
	"Page not found"
end