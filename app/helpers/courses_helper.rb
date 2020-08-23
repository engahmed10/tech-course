module CoursesHelper

    def education_id_field(course)
       
        if course.education.nil? 
            select_tag("course[education_id]",options_from_collection_for_select(Education.all,:id,:name,:prompt => true))
          else 
            hidden_field "course[education_id]",course.education_id  
        end          
    end
    
end

