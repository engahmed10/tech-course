class CoursesController < ApplicationController
  before_action: find_course

    def index
      @courses=Course.all
    end

    def new
        # code
       
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
