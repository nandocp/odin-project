class RenameColumnRememberTokenFromUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :members, :remeber_token, :remember_token
  end
end
