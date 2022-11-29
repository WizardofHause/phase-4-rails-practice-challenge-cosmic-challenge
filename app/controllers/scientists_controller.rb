class ScientistsController < ApplicationController
    # --- THESE METHODS MOVED TO APPLICATION_CONTROLLER.RB ---
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # --- REFACTORING FOR FIND_SCIENTIST TO MAKE METHODS SHORTER ---
    before_action :set_scientist, only: [:show, :update, :destroy]
    # ^^^ before running the request for show, update, and delete, execute the find_scientist method

    def index 
        render json: Scientist.all, status: :ok
    end

    # def show
    #     scientist = find_scientist
    #     render json: scientist, serializer: ScientistPlanetSerializer
    # end

    def show
        render json: @scientist, serializer: ScientistPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end
    
    # def update
    #     scientist = find_scientist
    #     scientist.update!(scientist_params)
    #     render json: scientist, status: :accepted
    # end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    # def destroy
    #     scientist = find_scientist
    #     scientist.missions.destroy_all
    #     scientist.destroy
    #     render json: {}
    # end

    def destroy
        @scientist.missions.destroy_all
        @scientist.destroy
        render json: {}
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    # def find_scientist
    #     Scientist.find(params[:id])
    # end

    def set_scientist
        @scientist = Scientist.find(params[:id])
    end

    # --- THESE METHODS WERE MOVED TO APPLICATION_CONTROLLER.RB ---
    # def render_not_found_response
    #     render json: { error: "Scientist not found" }, status: :not_found
    # end

    # def render_unprocessable_entity_response(invalid)
    #     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    # end

end
