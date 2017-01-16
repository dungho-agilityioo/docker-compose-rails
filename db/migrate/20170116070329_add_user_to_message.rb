class AddUserToMessage < ActiveRecord::Migration[5.0]
  def change
  	add_reference :messages, :user, index: true
  	ActiveRecord::Base.connection.execute("TRUNCATE TABLE messages")
  end
end
