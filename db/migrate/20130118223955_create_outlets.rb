class CreateOutlets < ActiveRecord::Migration
  def change
    create_table :outlets do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :address
      t.string :phone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
