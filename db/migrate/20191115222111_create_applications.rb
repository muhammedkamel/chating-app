# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :key
      t.string :name
      t.integer :chats_count
      t.integer :lock_version
      t.timestamps
    end
    change_column :applications, :chats_count, :integer, default: 0
    change_column :applications, :lock_version, :integer, default: 0
    add_index :applications, :key, unique: true
  end
end
