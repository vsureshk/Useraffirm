class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :gender
      t.string :location
      t.string :phone_number
      t.string :email_token
      t.string :mobile_token
      t.boolean :email_verified, default: false
      t.boolean :mobile_verified, default: false

      t.timestamps null: false
    end
  end
end
