class Education < ApplicationRecord
    belongs_to :user
    has_many :courses 
    has_many :institutes, through: :courses
    validates :name, presence: true
    validates :name, uniqueness: true
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
end