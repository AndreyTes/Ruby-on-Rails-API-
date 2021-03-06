module Api
    module V1
      class PostsController < ApplicationController
        before_action :get_user, only:[:create, :update, :destroy]

        def index
          posts = Post.order('created_at DESC')
          render json: {status: 'SUCCESS', message:'Loaded posts', data:posts}, status: :ok
        end

        def show
          post = Post.find_by(id: params[:id])
          if post
            render json: {status: 'SUCCESS', message:'Loaded posts', data:post}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Post undefined' }, status: :not_found
          end
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
          post = @user.posts.find_by(id: params[:id])
          if post.nil?
            render json: {status: 'ERROR', message:'You cant update alien post'}, status: :unprocessable_entity
          else
            post.update(post_params)
            render json: {status: 'SUCCESS', message:'Updated post', data:post}, status: :ok
          end
        end

        def destroy
          post = @user.posts.find_by(id: params[:id])
          if post.nil?
            render json: {status: 'ERROR', message:'You cant delete alien post'}, status: :unprocessable_entity
          else
            post.destroy
            render json: {status: 'SUCCESS', message:'Deleted post', data: post}, status: :ok
          end
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
