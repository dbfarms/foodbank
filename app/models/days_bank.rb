class DaysBank < ActiveRecord::Base 
  belongs_to :foodbank 
  belongs_to :day
  
end 