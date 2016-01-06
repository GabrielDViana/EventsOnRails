class UserSignUp < ActiveRecord::Migration
  def change
    create_table :users do |f|
      f.string :nickname
      f.string :complete_name
      f.string :email
      f.string :password_digest
      f.boolean :email_confirmed
      f.string :confirm_token
      f.timestamps null: false
    end
  end
end
