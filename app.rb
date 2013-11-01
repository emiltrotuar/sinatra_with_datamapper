require 'sinatra'
require 'sinatra/reloader' if development?
require 'data_mapper'

configure :development do
  DataMapper.setup(:default, {
    :adapter  => 'sqlite3',
    :host     => 'localhost',
    :username => 'root' ,
    :password => '',
    :database => 'sinatra_development'})  
  DataMapper::Logger.new($stdout, :debug)
end

get '/' do
  if exists? 
    Session.create @user.id, @user.name, Time.now
  end
	@sessions = Session.all
	erb :index
end

get '/login' do
	erb :login
end

get '/new' do
	@user = User.new
	erb :signup
end

post '/' do
  @user = User.create! name: params[:name], created_at: Time.now
  # @sessions = @user.records.create(created_at: Time.now)
  Session.create @user.id, @user.name, @user.created_at
  redirect '/'
end

not_found do
	status 404
	"Page not found"
end
