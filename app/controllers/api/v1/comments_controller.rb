module Api
    module V1
      class CommentsController < ApplicationController
        before_action :get_post
        before_action :get_user

        def index
          comments = @post.comments.order('created_at DESC')
          render json: {status: 'SUCCESS', message:'Loaded comments', data:comments}, status: :ok
        end

        def show
          comment = @post.comments.find(params[:id])
          render json: {status: 'SUCCESS', message:'Loaded comments', data:comment}, status: :ok
        end

        def create
          comment = @post.comments.create(comment_params)
          comment.user_id = @user.id
          if comment.save
          render json: {status: 'SUCCESS', message: 'Comment saved' , data: comment}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Comment not saved' , data: comment.errors}, status: :unprocessable_entity
          end
        end

        def update
          comment = @user.comments.find(params[:id])
          if comment.update(comment_params)
              render json: {status: 'SUCCESS', message:'Updated comment', data:comment}, status: :ok
            else
              render json: {status: 'ERROR', message:'Comment not updated', data:comment.errors}, status: :unprocessable_entity
          end
        end

        def destroy
          if @user.id == @post.user_id
            comment = @post.comments.find(params[:id])
            comment.destroy
            render json: {status: 'Deleted comment in your post' }

          else
            comment = @user.comments.find(params[:id])
            comment.destroy
            render json: {status: 'Deleted comment in alien post' }
          end
        end

        private
        def comment_params
          params.permit(:title, :description)
        end

        def get_user
          @user = @current_user
        end

        def get_post
          @post = Post.find(params[:post_id])
        end

      end
    end
end
