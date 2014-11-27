class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :slider_image
      t.text :caption

      t.timestamps
    end
  end
end
