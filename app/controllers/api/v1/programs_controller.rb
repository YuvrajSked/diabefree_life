module Api
  module V1
    class ProgramsController < ApplicationController
      before_action :set_program, only: [ :show ]

      def index
        @programs = Program.all
        render json: @programs, each_serializer: ProgramSerializer
      end

      def show
        render json: @program, serializer: ProgramSerializer
      end

      # def create
      #   @program = Program.new(program_params)
      #   if @program.save
      #     render json: @program, status: :created
      #   else
      #     render json: @program.errors, status: :unprocessable_entity
      #   end
      # end

      # def update
      #   if @program.update(program_params)
      #     render json: @program
      #   else
      #     render json: @program.errors, status: :unprocessable_entity
      #   end
      # end

      # def destroy
      #   @program.destroy
      #   head :no_content
      # end

      private

      def set_program
        @program = Program.find(params[:id])
      end

      # def program_params
      #   params.require(:program).permit(:title, :description, :features, :price, :duration, :program_type, :active)
      # end
    end
  end
end
