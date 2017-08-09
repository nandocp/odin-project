class AddRememberTokenToMembers < ActiveRecord::Migration[5.1]
  def change
  	add_column :members, :remeber_token, :string
  end
end
