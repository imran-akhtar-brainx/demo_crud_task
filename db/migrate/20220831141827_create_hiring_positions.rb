class CreateHiringPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :hiring_positions do |t|
      t.string :title
      t.timestamps
    end
  end
end
