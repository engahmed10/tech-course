class CoursesController < ApplicationController
 # before_action :find_course
  before_action :authenticate_user! 
  #before_action :authenticate_admin! ,only: [:index,:show]

    def index
        if params[:education_id]
            @education= Education.find_by(params[:education_id])
            if @education.nil?
                flash[:alert]="Education not found"
                redirect_to educations_path  # alert 'Education not found'
            else
              @courses = @education.courses
            end
        else
            @courses=Course.all
        end
      
    end

    def new    

        if params[:education_id] && !Education.exists?(params[:education_id])
            redirect_to educations_path alert="Education not found"
        else
          # @course = Educaion.find_by(params[:education_id]).courses.build
           @course=Course.new(education_id: params[:education_id])
        end
    end

    def create
        course = Course.new(course_params)
       # byebug
        if course.save 
          redirect_to course
        else
          render :new
        end
    end

    def show
       if params[:education_id]
          #@tech=Tech.find_by(id: params[:tech_id])
          @education =Education.where(id:params[:education_id]).take
          if ! @eduaction
               flash[:alert] ="Eduaction not found"
               redirect_to educations_path
          else
             @course = @education.courses.find_by(id: params[:id])
          if @course.nil?
            flash[:alert]="Course not found"
            redirect_to education_courses_path(@education) #alert="Course not found"
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
              redirect_to  educations_path alert="Education not found"
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

       @course =Course.find(id: params[:id])
       @course.delete 
       flash[:notice] = "Course deleted"
       redirect_to courses_path
    
    end

      private
      
     #def find_course
      #   Course.find(params[:id])
     #end

     def course_params
       params.require(:course).permit(:name,:course_description,:cost_total,:duration,:education_id,:institiute_id)
     end

end
