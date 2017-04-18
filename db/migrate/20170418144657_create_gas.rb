class CreateGas < ActiveRecord::Migration[5.0]
  def change
    create_table :gas do |t|
      t.string :state
      t.float :price

      t.timestamps
    end
  end
end
