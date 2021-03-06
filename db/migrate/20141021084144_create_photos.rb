class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.text :caption
      t.references :user, index: true
      t.timestamps
    end
  end
end
