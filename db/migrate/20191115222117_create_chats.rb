# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.integer :messages_count
      t.integer :lock_version
      t.references :application, foreign_key: true
      t.timestamps
    end
    change_column :chats, :messages_count, :integer, default: 0
    change_column :chats, :lock_version, :integer, default: 0
    add_index :chats, %i[number application_id], unique: true
  end
end
