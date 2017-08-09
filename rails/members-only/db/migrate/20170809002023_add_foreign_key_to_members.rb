class AddForeignKeyToMembers < ActiveRecord::Migration[5.1]
  def change
  	add_reference :posts, :member, foreign_key: true
  end
end
