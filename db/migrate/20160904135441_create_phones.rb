class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.decimal :price
      t.string :link

      t.timestamps
    end
  end
end
