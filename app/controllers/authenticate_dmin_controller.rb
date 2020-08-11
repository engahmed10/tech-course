class AuthenticateAdminController  < ApplicationController


    def authenticate_admin!
        authenticate_user!
        redirect_to :courses_path, status: :forbidden unless current_user.admin?
    end

end

