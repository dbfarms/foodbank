class FarmerController < ApplicationController
  
  get '/farmers' do 
    erb :'/farmers/farmers' 
  end 
  
  get '/farmers/new' do 
    erb :'/farmers/new'
  end 
  
  get '/farmers/:id' do 
    @farmer = Farmer.find(params["id"])
    erb :'/farmers/show'
  end
  
  get '/farmers/:id/edit' do 
    @farmer = Farmer.find(params["id"])
    erb :'/farmers/edit'
  end 
  
  get '/logout' do
    if session[:id] != nil 
      session.clear 
    end 
    redirect '/index'
  end 
  
  delete'/delete/:id' do 
    binding.pry
    if session[:id] == params["id"].to_i
      binding.pry
      @farmer = Farmer.delete(params["id"])
      redirect '/'
    else 
      redirect '/farmers'
    end 
  end 
  
  
  post '/farmers' do 
    @new_farm = Farmer.create(:name => params["name"])
    
    params["days"].each do |day|
      @new_farm.days << Day.find(day)  
    end 
    
    @new_farm.save 
  
    redirect "/farmers/#{@new_farm.id}" 
  end 
  
  patch '/farmers/:id' do 
    
    #binding.pry
    @farmer = Farmer.find(params["id"])
    @farmer.name = params["name"]
    @farmer.days = [] 
    
    params["days"].each do |day|
      @farmer.days << Day.find(day)  
    end 
    
    redirect "/farmers/#{@farmer.id}"
  end 
  
  post '/logout' do 
  
    if session[:id] != nil 
      session.clear 
    end 
    redirect '/index'
  end 
  
end 