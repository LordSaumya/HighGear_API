class UsersController < ApplicationController
    #GET /users [Get all users]
    def index
        @users = User.all
        render json: @users
    end
    #GET /users/s/:username [Get a specific user by their username]

    def search
        @user = User.where("username = ?", params[:username])
        render json: @user
    end

    #GET /users/:username/comments [Get all comments for a specific user]
    def comments
          # Find the user with the specified username
          @user = User.find_by(username: params[:username])
      
          # Get all the comments belonging to that user
          @comments = Comment.where(User_id: @user.id)
      
          # Render the comments in the comments template
          render json: @comments
    end

    #GET /users/:id [Get a specific user by their ID]
    def show
        @user = User.find(params[:id])
        render json: @user
    end
    #POST /users [Create a user] 
    def create
        @user = User.new(user_params)
        if @user.save
            # UserMailer.welcome_email(@user).deliver_later
            render json: @user
        else
            render error: {error: "Error in creating user"}, status: 400
        end
    end
    #PUT /users/:id [Update a user]
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: "User successfully updated"}, status: 200
        else
            render error: {error: "Error in updating user"}, status: 400
        end
    end
    #DELETE /users/:id [Delete a user]
    def destroy
        @user = User.find(params[:id])
        if @user
            @threads = ForumThread.where(User_id: @user.id)
            for @thread in @threads
                @thread.destroy
            end
            @comments = Comment.where(User_id: @user.id)
            for @comment in @comments
                @comment.destroy
            end
            
            @user.destroy
            render json: {message: "User successfully deleted"}, status: 200
        else
            render error: {error: "Error in deleting user"}, status: 400
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :bio)
    end
end
