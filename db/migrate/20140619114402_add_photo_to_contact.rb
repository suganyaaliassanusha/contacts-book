class AddPhotoToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :photo, :string
  end
end
