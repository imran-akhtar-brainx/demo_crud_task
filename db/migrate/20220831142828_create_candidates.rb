class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :address
      t.integer :age
      t.float :cgpa
      t.references :hiring_position, foreign_key: true
      t.timestamps
    end
  end
end
