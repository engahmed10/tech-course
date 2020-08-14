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
     @education=current_user.educations.build
  
   end
   
   def create
       @education=current_user.educations.create(education_params)
       if @education.valid?
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
     params.require(:education).permit(:name,:resource,:image)
   end

   def find_education
       @education=Education.find(params[:id])
   end
end
