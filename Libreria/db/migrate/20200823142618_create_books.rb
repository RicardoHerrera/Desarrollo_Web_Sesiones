class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :titulo
      t.integer :author_id
      t.text :descripcion
      t.string :estado
      t.boolean :visible, :default => false

      t.timestamps
    end
  end
end
