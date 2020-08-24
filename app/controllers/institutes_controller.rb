class InstitutesController < ApplicationController

   before_action :find_institute ,only: [:show,:edit,:update]

    def index 
    # @institutes=Institute.all
     Institute.order_by_name
    end

    def new
        
    end

    def create
        @institute = Institute.new(institute_params)
        if @institute.save 
            redirect_to @institute
        else
            render :new
        end     
    end

    def show 

    end

    private
    
    def institute_params
        params.permit(:name,:address,:city,:phone,:url)
    end

    def find_institute
        @institute=Institute.find(params[:id])
    end

end
