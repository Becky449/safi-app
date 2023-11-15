class AddContactPersonToAgrovet < ActiveRecord::Migration[7.0]
  def change
    add_column :agrovets, :contact_name, :string
    add_column :agrovets, :contact_phone, :integer
  end
end
