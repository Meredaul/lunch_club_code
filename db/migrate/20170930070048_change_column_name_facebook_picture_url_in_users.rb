class ChangeColumnNameFacebookPictureUrlInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :facebook_picture_url, :picture_url
    remove_column :users, :google_picture_url
  end
end
