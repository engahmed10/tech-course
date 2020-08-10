class CreateTeches < ActiveRecord::Migration[6.0]
  def change
    create_table :teches do |t|
      t.string :name
      t.string :resource
      t.integer :user_id

      t.timestamps
    end
  end
end
