module Errors
  module Handler
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
      rescue_from ActiveRecord::RecordNotUnique, with: :render_conflict
      rescue_from ActionController::ParameterMissing, with: :render_bad_request
      rescue_from StandardError, with: :render_internal_error
    end

    private

    def render_not_found(error)
      render json: { error: error.message }, status: :not_found
    end

    def render_unprocessable_entity(error)
      render json: { error: error.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_conflict(error)
      render json: { error: "Conflict: #{error.message}" }, status: :conflict
    end

    def render_bad_request(error)
      render json: { error: "Bad Request: #{error.message}" }, status: :bad_request
    end

    def render_internal_error(error)
      Rails.logger.error(error.message)
      Rails.logger.error(error.backtrace.join("\n"))
      render json: { error: "Internal Server Error" }, status: :internal_server_error
    end
  end
end
