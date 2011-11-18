class Openid < ActiveRecord::Migration
  def up
    alter_table :users do |t|
      t.openid_authenticatable
    end
    add_index :users, :identity_url, :unique => true
  end

  def down
  end
end
