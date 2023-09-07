module Api
  module V1
    class YachtsController < ApplicationController
      def show
        @yacht = Yacht.find(params[:id])
        render json: @yacht
      end
    end
  end
end
