# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.string :content
      t.integer :lock_version
      t.references :chat, foreign_key: true
      t.timestamps
    end
    change_column :messages, :lock_version, :integer, default: 0
    add_index :messages, %i[number chat_id], unique: true
  end
end
