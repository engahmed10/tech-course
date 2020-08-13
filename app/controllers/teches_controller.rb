class TechesController < ApplicationController

    before_action :authenticate_user!,except: [:index,:show]
    #before_action :authenticate_admin! ,only: [:index,:show]
    before_action :find_tech ,only: [:show,:update,:edit,:destroy]
    
    
    def index
        @teches =Tech.all
    end

    def show
        
    end

    def new
      @tech=current_user.teches.build
    end
    
    def create
        @tech=current_user.teches.create(tech_params)
        if @tech.valid?
            redirect_to tech_path(@tech)
        else
            render :new     
        end
    end

    def edit
      
    end
    
    def update
        @tech.update(tech_params)
        if @tech.valid?
            redirect_to tech_path(@tech)
        else
            render :update    
        end
    end

    def destroy
      # code
      @tech.delete

      redirect_to teches_path
    end


    private
    
    def tech_params
      params.require(:tech).permit(:name,:resource,:image)
    end

    def find_tech
        @tech=Tech.find(params[:id])
    end
end
