module Api
    module V1
      class PostsController < ApplicationController
        before_action :get_user

        def index
          posts = Post.order('created_at DESC')
          render json: {status: 'SUCCESS', message:'Loaded posts', data:posts}, status: :ok
        end

        def show
          post = @user.posts.find(params[:id])
          render json: {status: 'SUCCESS', message:'Loaded posts', data:post}, status: :ok
        end

        def create
          post = @user.posts.create(post_params)
          if post.save
          render json: {status: 'SUCCESS', message: 'Post saved' , data: post}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Post not saved' , data: post.errors}, status: :unprocessable_entity
          end
        end

        def update
          post = @user.posts.find(params[:id])
          if post.update(post_params)
              render json: {status: 'SUCCESS', message:'Updated post', data:post}, status: :ok
            else
              render json: {status: 'ERROR', message:'Post not updated', data:post.errors}, status: :unprocessable_entity
          end
        end

          def destroy
            post = @user.posts.find(params[:id])
            post.destroy
            render json: {status: 'SUCCESS', message:'Deleted post', data: post}, status: :ok
          end

        private

        def post_params
          params.permit(:title, :description)
        end

        def get_user
          @user = @current_user
        end
      end
    end
end
