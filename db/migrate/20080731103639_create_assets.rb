class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :name
      t.string :filename
      t.string :content_type
      t.integer :size
      t.integer :width
      t.integer :height
      t.string :thumbnail
      t.integer :user_id
      t.integer :parent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
