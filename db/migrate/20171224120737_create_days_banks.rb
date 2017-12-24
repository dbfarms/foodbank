class CreateDaysBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :days_banks do |t|
      t.integer :foodbank_id 
      t.integer :day_id 
    end 
  end
end
