class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :gender
      t.string :location
      t.string :phone_number
      t.string :token

      t.timestamps null: false
    end
  end
end
