class Course < ApplicationRecord

  has_many :t_courses
  has_many :teches, through: :t_courses
    
end
