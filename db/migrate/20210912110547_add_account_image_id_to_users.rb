class AddAccountImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_image_id, :string
  end
end
