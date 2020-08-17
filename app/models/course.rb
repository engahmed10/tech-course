class Course  < ApplicationRecord 

    belongs_to  :education, optional: true
    belongs_to  :institute, optional: true
    validates :name,presence: true
    validates :duration, presence: true
    validates :cost_total, presence: true
    validates :course_description,presence: true

    def self.search_by(word)
        institute=Institute.find_by(:name => word)
        if institute 
          self.where(institute_id: institute)
        end
    end

    def self.search_by_word(word)
        self.all.where("name LIKE ?","%#{word}%")
    end
    
    def education_name
      self.try(:education).try(:name)
    end

    def education_name=(name)
        @education=Education.find_or_create_by(name: name)
        self.education = @education
    end

end

