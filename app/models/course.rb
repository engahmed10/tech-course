class Course < ApplicationRecord
  has_many :teches, through: :tech_course
    
end
