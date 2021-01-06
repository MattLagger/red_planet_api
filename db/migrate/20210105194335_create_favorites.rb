class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :image_id
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.string :image_date
      t.string :rover_name
      t.string :camera_name

      t.timestamps
    end
  end
end
