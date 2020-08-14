class CreateInstitutes < ActiveRecord::Migration[6.0]
  def change
    create_table :institutes do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :phone
      t.string :url
      t.timestamps
    end
  end
end
