class Education < ApplicationRecord
    belongs_to :user
    has_many :courses 
    has_many :institute, through: :courses
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end