class UpdateRolesForSpecificEmails < ActiveRecord::Migration[7.0]
  def change
    User.find_by(email: 'safiorganics1@gmailcom')&.update(role: :admin)
    User.find_by(email: 'joycekamande54@gmail.com')&.update(role: :manager)
  end
end
