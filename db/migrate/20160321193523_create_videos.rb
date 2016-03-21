class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string 'name', limit: 255, null: false
      t.string 'description', limit: 255
      t.string 'path', limit: 255

      t.index 'name', unique: true
      t.timestamps
    end
  end
end
