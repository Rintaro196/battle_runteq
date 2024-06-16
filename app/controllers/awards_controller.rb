class AwardsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create destroy]
    before_action :set_award, only: %i[show destroy]
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

    def destroy
        @award = current_user.awards.find(params[:id])
        @award.destroy!
        redirect_to awards_path, status: :see_other
    end

    private

    def set_award
        @award = Award.find(params[:id])
    end

    def award_params
        params.require(:award).permit(:award_name, :title, :body)
    end
end
