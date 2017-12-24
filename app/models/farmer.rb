class Farmer < ActiveRecord::Base
  has_many :days 
  has_many :foodbanks, through: :days 
  
  has_secure_password 
  
end 