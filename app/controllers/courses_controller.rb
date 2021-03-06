class CoursesController < ApplicationController
 # before_action :find_course
  before_action :authenticate_user! 
  #before_action :authenticate_admin! ,only: [:index,:show]

  def index
       
      if params[:q]
          @courses= Course.search_by_word(params[:q])
          if @courses.nil?
            redirect_to courses_path
          end
      else          
           if ! params[:education_id].nil?
                 @education= Education.find_by(id: params[:education_id])
                if @education.nil?
                    flash[:alert]="Education not found"
                    redirect_to educations_path , alert: "Education not found"
                else                  
                  courses = @education.courses
                  @courses =courses.where(user:current_user)                                    
                end             
            else 
               # @courses= Course.order_by_course_name
             user=User.where(admin: true).take
             @courses=user.courses       
           end
      end
    end

    def new    

        if params[:education_id] && !Education.exists?(params[:education_id])
            redirect_to educations_path alert="Education not found"
        else 
          @course=Course.new(education_id: params[:education_id])  
        end
    end

    def create
          @course = Course.new(course_params) 
          @course.user = current_user
          
          ## diffrent params education_id for nested route
          if  @course.education_id.nil?
              @course.education_id=params[:course][:education_id].keys.inject
          end
          if @course.save 
             current_user.courses << @course
             redirect_to education_course_path(@course.education,@course)
          else
            render :new
          end
    end

    def show
       if params[:education_id]
          @education =Education.where(id:params[:education_id]).take

          if ! @education
               flash[:alert] ="Eduaction not found"
               redirect_to educations_path , alert: "Education not found."
          else
            
             @course = @education.courses.find_by(id: params[:id])
            if @course.nil?
              flash[:alert]="Course not found"
              redirect_to education_courses_path(@education) , alert: "Course not found"
            end 
          end
       else
           @course=Course.find(params[:id])   
       end 
    end

    def edit
        @course= Course.find_by(id:params[:id])

        if params[:education_id]
            education =Education.find_by(id: params[:education_id])
           if education.nil?
              redirect_to  educations_path , alert: "Education not found"
           else
            @course = education.courses.find_by(id: params[:id])
            redirect_to education_courses_path(eduaction) if @course.nil?
           end               

        else
              @course=Course.find_by(id: params[:id])
        end

    end

    def update

       @course=Course.find_by(id: params[:id])
       @course.update(course_params)
       if @course.save 
           redirect_to @course
       else
           render :edit
       end

    end

    def destroy
    
       @course =Course.find(params[:id])
       @course.delete 
       flash[:notice] = "Course deleted"
       redirect_to courses_path
    
    end

      private
      
     #def find_course
      #   Course.find(params[:id])
     #end
     def course_params
       params.require(:course).permit(:name,:course_description,:cost_total,:duration, :education_id,:institute_id)
     end

end
