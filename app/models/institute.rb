class Institute < ApplicationRecord
    has_many :courses
    has_many :educations ,through: :courses
    scope :order_by_name ,->{(limit(20).order(:name))}
    

end
