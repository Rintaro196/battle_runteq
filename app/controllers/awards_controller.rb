class AwardsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create]
    before_action :set_award, only: %i[show]
    def index
        @awards = Award.includes(:user)
    end

    def show
        @award = Award.includes(:user).find(params[:id])
    end

    def new
        @award = Award.new
    end

    def create
        @award = Award.new(award_params.merge(user_id: current_user.id ))
        if @award.save
            redirect_to awards_path
        else
            render :new
        end
    end

    private

    def set_award
        @award = Award.find(params[:id])
    end

    def award_params
        params.require(:award).permit(:award_name, :title, :body)
    end
end
