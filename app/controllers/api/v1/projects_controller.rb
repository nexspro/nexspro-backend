module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        projects = Project.all
        render json: ProjectBlueprint.render(projects)
      end

      def show
        project = Project.find(params[:id])
        render json: ProjectBlueprint.render(project)
      end

      def create
        project = Project.new(project_params)
        if project.save
          render json: ProjectBlueprint.render(project), status: :created
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        project = Project.find(params[:id])
        if project.update(project_params)
          render json: ProjectBlueprint.render(project)
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        project = Project.find(params[:id])
        project.destroy
        head :no_content
      end

      private

      def project_params
        params.require(:project).permit(:title, :description, :github_url, :demo_url, :started_at, :finished_at, :status, :account_id, :client_id)
      end
    end
  end
end
