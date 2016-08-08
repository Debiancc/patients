class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.datetime :birthday
      t.integer :gender
      t.integer :status
      t.integer :viewed_count, default: 0
      t.timestamps null: false

      t.references :location
    end
  end
end
