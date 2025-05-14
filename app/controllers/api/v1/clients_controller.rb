module Api
  module V1
    class ClientsController < ApplicationController
      def index
        clients = Client.all
        render json: ClientBlueprint.render(clients)
      end

      def show
        client = Client.find(params[:id])
        render json: ClientBlueprint.render(client)
      end

      def create
        client = Client.new(client_params)
        if client.save
          render json: ClientBlueprint.render(client), status: :created
        else
          render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        client = Client.find(params[:id])
        if client.update(client_params)
          render json: ClientBlueprint.render(client)
        else
          render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        client = Client.find(params[:id])
        client.destroy
        head :no_content
      end

      private

      def client_params
        params.require(:client).permit(:name, :website, :logo)
      end
    end
  end
end
