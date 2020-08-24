class EducationsController < ApplicationController


   before_action :authenticate_user!
   before_action :authenticate_admin! ,except: [:index,:show]
   before_action :find_education ,only: [:show,:update,:edit,:destroy]
   
   
   def index
    
       @educations = Education.all
   end

   def show
      
   end

   def new
     @education = current_user.educations.build
     @education.courses.build(:name=>"course")
   end
   
   def create
    
       @education = current_user.educations.build(name:params[:education][:name],image:params[:education][:image],resource:params[:education][:resource])
       @course=current_user.courses.build(education_params)
       @course.education = @education
       @course.save
       
       if @education.valid?
        
          @education.courses << @course
          redirect_to education_path(@education)
       else
          render :new     
       end

   end

   def edit
     
   end
   
   def update
         @education.update(education_params)
       if @education.valid?
           redirect_to education_path(@education)
       else
           render :update    
       end
   end

   def destroy
     
     @education.delete
     redirect_to educations_path

   end


   private
   
   def education_params     
        if ! params[:education][:course_ids].blank?
           params.require(:education).permit(:name,:resource,:image,:course_ids)
        
        else 
          params.require(:education).require(:courses).permit(:name,:course_description,:cost_total,:duration,:institute_id)
        end
    end

   def find_education
       @education=Education.find(params[:id])
   end

end
