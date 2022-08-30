class SpicesController < ApplicationController 
# spices GET    /spices(.:format)     spices#index
#        POST   /spices(.:format)     spices#create
#  spice GET    /spices/:id(.:format) spices#show
#        PATCH  /spices/:id(.:format) spices#update
#        PUT    /spices/:id(.:format) spices#update
#        DELETE /spices/:id(.:format) spices#destroy

    def index
      spices = Spice.all
      render json: spices
    end

    def create
      new_spice = Spice.create(spice_params)
      render json: new_spice, status: :created
    end

    def show
      spice = Spice.find(params[:id])
      if spice
        render json: spice
      else
        render json: { error: "Spice not found" }, status: 404
      end
    end

    def update
      spice = Spice.find(params[:id])
      if spice
        spice.update(spice_params)
        render json: spice
      else
        render json: { error: "Spice not found" }, status: 404
      end
    end

    def destroy
      spice = Spice.find(params[:id])
      if spice
        spice.destroy
      else
        render json: { error: "Spice not found" }, status: 404
      end
    end

    private 

    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end

end
