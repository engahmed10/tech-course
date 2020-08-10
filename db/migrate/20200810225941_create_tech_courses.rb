class CreateTechCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :tech_courses do |t|
      t.integer :tech_id
      t.integer :course_id

      t.timestamps
    end
  end
end
