class Course  < ApplicationRecord 

    belongs_to  :education
    belongs_to  :institute
    validates :name,presence: true
    validates :duration, presence: true
    validates :cost_total, presence: true
    validates :course_description,presence: true

    def self.search_by(word)
        institute=Institute.find_by(:name => word)
        if institute 
          self.all.where(institute_id: institute)
        end
    end
    

end

