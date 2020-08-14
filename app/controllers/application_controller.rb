class ApplicationController < ActionController::Base
   # user_signed_in?  #to verify user signed in
   before_action :authenticate_user!

   def destroy
      session.destroy
      redirect_to root_path
   end

   private

   def authenticate_admin!
       authenticate_user!
       head :forbidden unless current_user.admin?
   end

 
end
