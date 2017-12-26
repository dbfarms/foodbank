require 'rack-flash'

class ApplicationController < Sinatra::Base 
  use Rack::Flash 
  
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  
  register Sinatra::ActiveRecordExtension
  enable :sessions 
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do 
    redirect '/index' 
  end 
  
  get '/login' do 
    erb :login 
  end 
  
  get '/index' do 
    #binding.pry
    if session[:id] == nil 
      redirect 'login'
    else 
      @farmer = Farmer.find(session["id"])
      erb :index
    end 
  end 
  
  get '/calendar' do 
    erb :'days/days' 
  end 
  
  post '/login' do 
    @farmer = Farmer.find_by(:name => params["login"]["name"]) 
    if @farmer && @farmer.authenticate(params["login"]["password"]) 
      session[:id] = @farmer.id 
      redirect '/index'
    else 
      redirect '/login'
    end 
  end 
  
  post '/signup' do 
    @farmer = Farmer.create(:name => params["signup"]["name"], :password => params["signup"]["password"])
      @farmer.attributes.each do |att|
        binding.pry
        if att[1] == "" || att[1] == nil
          redirect "/login"
        end 
      end 
      
      @farmer.save 
      session[:id] = @farmer.id 
      redirect '/index'
      
  end 
end 

=begin
  post '/index' do 
    #binding.pry
    @farmer = Farmer.find_by(:name => params["name"]) 
    if @farmer && @farmer.authenticate(params["password"]) 
      session[:id] = @farmer.id 
      redirect '/index'
    else 
      #binding.pry
      @farmer = Farmer.create(:name => params["name"], :login => params["name"], :password =>["password"])
      @farmer.attributes.each do |att|
        #binding.pry
        if att[1] == "" || att[1] == nil
          redirect "/login"
        end 
      end 
      
      @farmer.save 
      session[:id] = @farmer.id 
      redirect '/index'
      
    end 
  end 
=end
  