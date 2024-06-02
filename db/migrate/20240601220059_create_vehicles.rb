class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :category
      t.string :model
      t.string :license_plate
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
