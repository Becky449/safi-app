class UpdateRolesForSpecificEmail < ActiveRecord::Migration[7.0]
  def change
    User.find_by(email: 'safiorganics1@gmail.com')&.update(role: 1)
  end
end
