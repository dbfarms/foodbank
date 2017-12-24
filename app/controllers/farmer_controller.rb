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
  
  post '/farmers' do 
    @new_farm = Farmer.create(:name => params["name"])
    
    params["days"].each do |day|
      @new_farm.days << Day.find(day)  
    end 
  
    redirect "/farmers/#{@new_farm.id}" 
  end 
  
end 