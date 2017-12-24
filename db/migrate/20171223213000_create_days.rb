class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :name 
      t.integer :foodbank_id 
    end 
  end
end
