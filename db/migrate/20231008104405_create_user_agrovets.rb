class CreateUserAgrovets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_agrovets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agrovet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
