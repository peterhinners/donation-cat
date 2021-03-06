class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :password_digest
      t.string :slug
      t.string :twitter_handle
      t.string :website
      t.string :donation_page

      t.timestamps null: false
    end
  end
end



