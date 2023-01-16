class ForumThreadsController < ApplicationController
    #GET /ForumThreads [Get all threads]
    def index
        @threads = ForumThread.all
        render json: @threads
    end

    #GET /ForumThreads/:id [Get a specific thread by its ID]
    def show
        @thread = ForumThread.find(params[:id])
        render json: @thread
    end

    #POST /ForumThreads [Create a thread] 
    def create
        @thread = ForumThread.new(thread_params)
        if @thread.save
            render json: @thread
        else
            render error: {error: "Error in creating thread"}, status: 400
        end
    end

    #PUT /ForumThreads/:id [Update a thread]
    def update
        @thread = ForumThread.find(params[:id])
        if @thread
            @thread.update(thread_params)
            render json: {message: "Thread successfully updated"}, status: 200
        else
            render error: {error: "Error in updating thread"}, status: 400
        end
    end

    #DELETE /ForumThreads/:id [Delete a thread]
    def destroy
        @thread = ForumThread.find(params[:id])
        @comments = Comment.where("ForumThread_id = ?", params[:id])
        if @thread
            for @comment in @comments
                @comment.destroy
            end
            @thread.destroy
            render json: {message: "Thread successfully deleted"}, status: 200
        else
            render error: {error: "Error in deleting thread"}, status: 400
        end
    end

    private
    def thread_params
        params.require(:forum_thread).permit(:User_id, :title, :description, :tag)
    end
end
