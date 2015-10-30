class AddAmazonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amazon_affiliate_id, :string, null: false, default: ""
    remove_column :users, :google_adsense_code, :text, null: false, default: ""
  end
end
