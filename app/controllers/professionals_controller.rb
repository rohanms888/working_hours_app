class ProfessionalsController < ApplicationController
    ...
    def create
      @professional = Professional.new(professional_params)
      if @professional.save
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @professional, notice: 'Professional was successfully created.' }
        end
      else
        render :new
      end
    end
  
    def update
      @professional = Professional.find(params[:id])
      if @professional.update(professional_params)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @professional, notice: 'Professional was successfully updated.' }
        end
      else
        render :edit
      end
    end
  
    def destroy
      @professional = Professional.find(params[:id])
      @professional.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to professionals_url, notice: 'Professional was successfully destroyed.' }
      end
    end
    ...
  end
  