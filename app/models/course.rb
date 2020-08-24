class Course  < ApplicationRecord 

    belongs_to  :education, optional: true
    belongs_to  :institute, optional: true
    belongs_to :user
    validates :name,presence: true
    validates :duration, presence: true
    validates :cost_total, presence: true
    validates :course_description,presence: true
 
    scope :order_by_course_name,->{(limit(20).order(:name))}

    def self.search_by(word)
        institute=Institute.find_by(:name => word)
        if institute 
          self.where(institute_id: institute)
        end
    end

    def self.search_by_word(word)
        self.all.where("name LIKE ?","%#{word}%")
    end
     

end

