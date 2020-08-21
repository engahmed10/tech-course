class Education < ApplicationRecord
    belongs_to :user
    has_many :courses 
    has_many :institutes, through: :courses
    validates :name, presence: true
    validates :name, uniqueness: true
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
   # accepts_nested_attributes_for :courses

    def courses_attributes=(course_attributes)
        
        course_attributes.values.each do |course_attribute|
            
          course = Course.find_or_create_by(course_attribute)
          self.courses << course
        end
    end
end