class Foodbank < ActiveRecord::Base
  has_many :days_banks  
  has_many :days, through: :days_banks 
  has_many :farmers, through: :days 
    
end 