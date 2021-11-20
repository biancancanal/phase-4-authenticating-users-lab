class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username]) #Find a user in the database using the username from params
        session[:user_id] = user.id #Save the user's ID to the session hash
        render json: user #Return the user as a JSON object
    end

    def destroy
        session.delete :user_id #Remove the user ID from the session hash
        head :no_content #Return an empty response with a 204 No Content status code
    end
end
