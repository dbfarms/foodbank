class ApplicationController < Sinatra::Base 
  
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  
  register Sinatra::ActiveRecordExtension
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
 
  post '/index' do 
    #binding.pry
    @farmer = Farmer.find_by(:name => params["name"]) 
    if @farmer && @farmer.authenticate(params["password"]) 
      session[:id] = @farmer.id 
      redirect '/index'
    else 
      #binding.pry
      @farmer = Farmer.create(:name => params["name"], :password =>["password"])
      @farmer.attributes.each do |att|
        if att[1] == "" || att[1] == nil
          redirect "/signup"
        else  
          @farmer.save 
          session[:id] = @farmer.id 
          redirect '/index'
        end
      end 
    end 
  end 
  
end 