module Api
  module V1
    class NewsPostsController < ApplicationController
      def index
        news_posts = NewsPost.published
        render json: NewsPostBlueprint.render(news_posts)
      end

      def show
        news_post = NewsPost.find(params[:id])
        render json: NewsPostBlueprint.render(news_post)
      end

      def create
        news_post = NewsPost.new(news_post_params)
        if news_post.save
          render json: NewsPostBlueprint.render(news_post), status: :created
        else
          render json: { errors: news_post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        news_post = NewsPost.find(params[:id])
        if news_post.update(news_post_params)
          render json: NewsPostBlueprint.render(news_post)
        else
          render json: { errors: news_post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        news_post = NewsPost.find(params[:id])
        news_post.destroy
        head :no_content
      end

      private

      def news_post_params
        params.require(:news_post).permit(:title, :content, :published_at)
      end
    end
  end
end
