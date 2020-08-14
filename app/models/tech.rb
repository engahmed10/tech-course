class Tech < ApplicationRecord
    belongs_to :user
    has_many :t_courses
    has_many :courses ,through: :t_courses
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
