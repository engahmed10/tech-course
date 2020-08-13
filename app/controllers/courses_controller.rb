class CoursesController < ApplicationController
  before_action :find_course
  before_action :authenticate_user! 
  #before_action :authenticate_admin! ,only: [:index,:show]

    def index

       if params[:tech_id]
            @tech = Tech.find_by(parame[:tech_id])
            if @tech.nil?
                redirect_to Something_path alert 'Tech not found'
            else
              @courses = @tech.courses
            end
        else
            @courses=Course.all
        end
      
    end

    def new    

    end

    def create
        # code
    end

    def show
        # code
    end

    def edit
        # code
    end

    def update
        # code
    end

    def destroy
        # code
    end

      private
      
     def find_course
         Course.find(params[:id])
     end

     def course_params
      params.require(:course).permit(:name,:price,:url)
     end

end
