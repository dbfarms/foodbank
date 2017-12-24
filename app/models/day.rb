class Day < ActiveRecord::Base
  belongs_to :farmer 
  has_many :days_banks
  has_many :foodbanks, through: :days_banks
  
end 