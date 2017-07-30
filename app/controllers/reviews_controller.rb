class ReviewsController < ApplicationController

    def create
        @review = current_user.reviews.create(review_params)
        if @review.save
            respond_to :js
        else
            redirect_to @review.room, alert: "Opps. Something went wrong!"
        end
    end

    def destroy
        @id = params[:id]
        review = Review.find(@id)
        @room = review.room

        review.destroy
        respond_to :js
    end

    private
        def review_params
            params.require(:review).permit(:comment, :star, :room_id)
        end
end