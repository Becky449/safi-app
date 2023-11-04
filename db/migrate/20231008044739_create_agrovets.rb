class CreateAgrovets < ActiveRecord::Migration[7.0]
  def change
    create_table :agrovets do |t|
      t.string :name
      t.json :location
      t.string :owner_name
      t.integer :owner_phone
      t.string :owner_email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
