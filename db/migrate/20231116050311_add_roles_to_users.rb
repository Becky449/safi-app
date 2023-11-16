class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0
    
    User.find_by(email: 'safiorganics1@gmailcom')&.update(role: :admin)
    User.find_by(email: 'joycekamande54@gmail.com')&.update(role: :manager)
  end
end
