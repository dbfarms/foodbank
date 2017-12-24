class Day < ActiveRecord::Base
  has_many :farmers 
  has_many :foodbanks 
  
end 