class Farmer < ActiveRecord::Base
  has_many :days 
  has_many :foodbanks, through: :days 
  
end 