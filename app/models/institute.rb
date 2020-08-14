class Institute < ApplicationRecord
    has_many :courses
    has_many :educations ,through: :courses
end
