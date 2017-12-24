class AddLogin < ActiveRecord::Migration[5.1]
  def change
    add_column :farmers, :login, :string 
    add_column :farmers, :password_digest, :string 
  end
end
