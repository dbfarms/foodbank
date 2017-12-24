class FoodbankController < ApplicationController
  
  get '/foodbanks' do 
    erb :'/foodbanks/foodbank' 
  end 
  
  get '/foodbanks/new' do 
    erb :'/foodbanks/new'
  end 
  
  get '/foodbanks/:id' do 
    @foodbank = Foodbank.find(params["id"])
    erb :'/foodbanks/show'
  end
  
  get '/foodbanks/:id/edit' do 
    @foodbank = Foodbank.find(params["id"])
    erb :'/foodbanks/edit'
  end 
  
  post '/foodbanks' do 
    @new_foodbank = Foodbank.create(:name => params["name"])
    
    params["days"].each do |day|
      @new_foodbank.days << Day.find(day)  
    end 
    
    @new_foodbank.save 
  
    redirect "/foodbanks/#{@new_foodbank.id}" 
  end 
  
  patch '/foodbanks/:id' do 
    
    #binding.pry
    @foodbank = Foodbank.find(params["id"])
    @foodbank.name = params["name"]
    @foodbank.days = [] 
    
    params["days"].each do |day|
      @foodbank.days << Day.find(day)  
    end 
    
    redirect "/foodbanks/#{@foodbank.id}"
  end 
  
end 