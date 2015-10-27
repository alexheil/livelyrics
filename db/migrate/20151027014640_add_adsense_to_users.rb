class AddAdsenseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :google_adsense_code, :text, null: false, default: ""
    remove_column :users, :publisher_id, :string, null: false, default: ""
    remove_column :users, :data_ad_slot, :string, null: false, default: ""
  end
end
