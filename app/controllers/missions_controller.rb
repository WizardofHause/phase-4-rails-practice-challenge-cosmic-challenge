class MissionsController < ApplicationController
    # --- THESE METHODS WERE MOVED TO APPLICATION_CONTROLLER.RB ---
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # NOT NEEDED FOR SOLUTION
    # def index
    #     render json: Mission.all, status: :ok
    # end

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
    
    # --- THESE METHODS WERE MOVED TO APPLICATION_CONTROLLER.RB ---
    # def render_unprocessable_entity_response
    #     render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    # end 

end
