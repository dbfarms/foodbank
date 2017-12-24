class Foodbank < ActiveRecord::Base
  has_many :days 
  has_many :farmers, through: :days 
  
end 