class FixColumnNameFromEmailToUser < ActiveRecord::Migration
  def up
  end

  def change
    rename_column :authors, :email, :username
  end

  def down
  end
end
