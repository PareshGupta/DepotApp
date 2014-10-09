class AddLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :login, :string
  end
end
