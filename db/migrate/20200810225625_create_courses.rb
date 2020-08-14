class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_description
      t.string :duration
      t.string :cost_total
      t.integer :education_id
      t.integer :institute_id
      t.timestamps
    end
  end
end
