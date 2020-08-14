class CoursesController < ApplicationController
 # before_action :find_course
  before_action :authenticate_user! 
  #before_action :authenticate_admin! ,only: [:index,:show]

    def index
      #byebug
       if params[:tech_id]
            @tech = Tech.find_by(params[:tech_id])
            if @tech.nil?
                flash[:alert]="Tech not found"
                redirect_to teches_path  # alert 'Tech not found'
            else
              @courses = @tech.courses
            end
        else
            @courses=Course.all
        end
      
    end

    def new    

        if params[:tech_id] && !Tech.exists?(params[:tech_id])
            redirect_to teches_path alert="Tech not found"
        else
           @course = Tech.find_by(params[:tech_id]).courses.build
           
        end
    end

    def create
        @course = Course.new(coures_params)
        if @course.save 
          redirect_to @course
        else
            render :new
        end
    end

    def show
       if params[:tech_id]
          #@tech=Tech.find_by(id: params[:tech_id])
          @tech =Tech.where(id:params[:tech_id]).take
          if ! @tech
               flas[:alert] ="Tech not found"
               redirect_to teches_path
          end
             @course = @tech.courses.find_by(id: params[:id])
          if @course.nil?
            redirect_to tech_courses_path(@tech) alert="Course not found"
          end 
       else
           @course=Course.find(params[:id])   
       end 
    end

    def edit
        if params[:tech_id]
            tech =Tech.find_by(id: params[:tech_id])
           if tech.nil?
              redirect_to  teches_path alert="Tech not found"
           end
           @course = tech.courses.find_by(id: params[:id])
           if @course.nil?
              redirect_to tech_courses_path(tech)
           end               

        else
              @course=Course.find(id: params[:id])
        end
    end

    def update

       @course=Course.find(id: params[:id])
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
       flas[:notice] = "Course deleted"
       redirect_to courses_path
    
    end

      private
      
     #def find_course
      #   Course.find(params[:id])
     #end

     def course_params
      params.require(:course).permit(:name,:price,:url)
     end

end
