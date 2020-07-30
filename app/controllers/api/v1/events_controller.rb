require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class EventsController < ApplicationController
      # load_and_authorize_resource
      # CSRF対策
      protect_from_forgery except: [:create, :update]

      def index
        # @events = Event.includes(:memo).where(user_id: current_user.id).order(:id).limit(params[:limit]).offset(params[:offset])
        @events = Event.where(user_id: current_user.id).order(:id).limit(params[:limit]).offset(params[:offset])
        json = @events
        render json: json.to_json
      end

      def show
        @event = Event.find(params[:id])
        render json: @event.to_json
      end

      def edit
        @event = Event.find(params[:id])
      end

      def update
        @event = Event.find(params[:id])
        event_params.require(:start)
        event_params.require(:end)
        event_params.require(:user_id)
        event_params.require(:text)
        event_params.require(:title)
        event_params.require(:image)
        respond_to do |format|
          format.any
          if @event.update!(event_params)
            @event.save
            render json: @event.to_json
          else
            render json: {status: "ng", code: 500, content: {message: "エラーだよ"}}
          end
        end
      end

      def new
        @event = Event.new
        @event.build_memo
      end

      def create
        @event = Event.new(event_params)
        @memo = @event.memo
        respond_to do |format|
          format.any
          if @event.save! && @memo.save!
            render json: @event
          else
            render json: {status: "ng", code: 500, content: {message: "エラーだよ"}}
          end
        end
      end

      def destroy
        @event = Event.find(params[:id])
        @event.destroy
        render json: @event
      end

      private
        def event_params
          params.require(:event).permit(
            :start,
            :end,
            :color,
            :allday,
            :user_id,
            memo_attributes: [:id, :_destroy, :title, :text, :user_id]
          )
        end

        def memo_params
          params.require(:memo).permit(:id, :title, :text, :user_id, :memo_id)
        end
    end
  end
end