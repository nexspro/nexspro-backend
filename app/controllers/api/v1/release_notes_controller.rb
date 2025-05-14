module Api
  module V1
    class ReleaseNotesController < ApplicationController
      def index
        notes = ReleaseNote.recent_first
        render json: ReleaseNoteBlueprint.render(notes)
      end

      def show
        note = ReleaseNote.find(params[:id])
        render json: ReleaseNoteBlueprint.render(note)
      end

      def create
        note = ReleaseNote.new(release_note_params)
        if note.save
          render json: ReleaseNoteBlueprint.render(note), status: :created
        else
          render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        note = ReleaseNote.find(params[:id])
        if note.update(release_note_params)
          render json: ReleaseNoteBlueprint.render(note)
        else
          render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        note = ReleaseNote.find(params[:id])
        note.destroy
        head :no_content
      end

      private

      def release_note_params
        params.require(:release_note).permit(:version, :content, :published_at)
      end
    end
  end
end
