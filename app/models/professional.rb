class ProfessionalsController < ApplicationController
    def index
      @professionals = Professional.all
    end
  
    def new
      @professional = Professional.new
      @professional.working_hours.build
    end
  
    def create
      @professional = Professional.new(professional_params)
      if @professional.save
        redirect_to @professional, notice: 'Professional was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @professional = Professional.find(params[:id])
    end
  
    def edit
      @professional = Professional.find(params[:id])
    end
  
    def update
      @professional = Professional.find(params[:id])
      if @professional.update(professional_params)
        redirect_to @professional, notice: 'Professional was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def professional_params
      params.require(:professional).permit(:name, working_hours_attributes: [:id, :day, :start_time, :end_time, :_destroy])
    end
  end
  
  