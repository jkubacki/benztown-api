# frozen_string_literal: true

class DeviseCreateMplcs < ActiveRecord::Migration[5.2]
  def change
    create_table :mplcs do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :mplcs, :email, unique: true
  end
end
