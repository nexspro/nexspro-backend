module Api
  module V1
    class SkillsController < ApplicationController
      def index
        skills = Skill.all
        render json: SkillBlueprint.render(skills)
      end

      def show
        skill = Skill.find(params[:id])
        render json: SkillBlueprint.render(skill)
      end

      def create
        skill = Skill.new(skill_params)
        if skill.save
          render json: SkillBlueprint.render(skill), status: :created
        else
          render json: { errors: skill.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        skill = Skill.find(params[:id])
        if skill.update(skill_params)
          render json: SkillBlueprint.render(skill)
        else
          render json: { errors: skill.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        skill = Skill.find(params[:id])
        skill.destroy
        head :no_content
      end

      private

      def skill_params
        params.require(:skill).permit(:name, :level, :icon)
      end
    end
  end
end
