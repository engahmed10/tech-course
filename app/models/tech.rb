class Tech < ApplicationRecord
    belongs_to :user
    has_many :techcourses
    has_many :courses ,through: :techcourse
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
