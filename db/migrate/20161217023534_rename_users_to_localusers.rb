class RenameUsersToLocalusers < ActiveRecord::Migration
  def change
    rename_table :users, :localusers  # この行を追加
  end
end
