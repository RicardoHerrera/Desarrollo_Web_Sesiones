class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :apellido

      t.timestamps
    end
  end
end
