require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require 'data_mapper'
require 'bcrypt'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/visits.sqlite3")

enable :sessions

class User
  include DataMapper::Resource
  property :name,       String, :key => true
  validates_length_of :name, min: 1
  property :password,   BCryptHash
  validates_length_of :password, min: 6
  property :created_at, DateTime
end

class Session
  include DataMapper::Resource
  property :id,         Serial
  property :rec,        String
  property :created_at, DateTime
  
  def inspect
   %Q{<td><strong>record id:</strong> #{@id}</td>
     <td><strong>user:</strong> #{@rec} </td>
     <td><strong>login time:</strong> #{@created_at.strftime("%d %b %H:%M:%S")}</td>}
  end
end

DataMapper.finalize.auto_upgrade!

get '/' do
	@sessions = Session.all
	erb :index
end

get '/login' do
	erb :login
end

post '/login' do
  @user = User.get(params[:login])
  if @user && @user.password == params[:password]
    Session.create! rec: @user.name, created_at: DateTime.now
    redirect '/'
  else
    flash[:error] = "wrong password/login"
    redirect '/login'
  end
end

get '/signup' do
	erb :signup
end

post '/signup' do
  @user = User.get(params[:login])
  if @user 
    flash[:error] = 'this name was already taken'
    redirect '/signup'
  else
    @user = User.create! name: params[:login], password: params[:password], created_at: DateTime.now
    Session.create! rec: @user.name, created_at: DateTime.now
    redirect '/'
  end
end

not_found do
	status 404
	"Page not found"
end