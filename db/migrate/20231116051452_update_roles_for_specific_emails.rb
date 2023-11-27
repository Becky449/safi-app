class UpdateRolesForSpecificEmails < ActiveRecord::Migration[7.0]
  def change
    User.find_by(email: 'safiorganics1@gmail.com')&.update(role: 1)
    User.find_by(email: 'joycekamande54@gmail.com')&.update(role: 2)
  end
end
