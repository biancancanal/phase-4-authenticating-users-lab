class UsersController < ApplicationController
    def show
        user = User.find_by(id: session[:user_id]) #Find a user in the database using the user id from the session hash
        if user #Return the user as a JSON object
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
    end
end
