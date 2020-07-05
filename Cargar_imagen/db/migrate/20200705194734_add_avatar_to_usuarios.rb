class AddAvatarToUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :avatar, :string
  end
end
