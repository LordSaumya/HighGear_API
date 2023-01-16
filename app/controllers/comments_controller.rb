class CommentsController < ApplicationController
    #GET /Comments [Get all comments for a specific thread]
    def index
        @Comments = Comment.where("ForumThread_id = ?", params[:forum_thread_id])
        render json: @Comments
    end

    #GET /Comments/:id [Get a specific comment by its ID]
    def show
        @Comment = Comment.find(params[:id])
        render json: @comment
    end

    #POST /Comments [Create a comment]
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment
        else
            render error: {error: "Error in creating comment"}, status: 400
        end
    end

    #PUT /Comments/:id [Update a comment]
    def update
        @comment = Comment.find(params[:id])
        if @comment
            @comment.update(comment_params)
            render json: {message: "Comment successfully updated"}, status: 200
        else
            render error: {error: "Error in updating comment"}, status: 400
        end
    end

    #DELETE /Comments/:id [Delete a comment]
    def destroy
        @comment = Comment.find(params[:id])
        if @comment
            @comment.destroy
            render json: {message: "Comment successfully deleted"}, status: 200
        else
            render error: {error: "Error in deleting comment"}, status: 400
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:ForumThread_id, :User_id, :content)
    end
end
