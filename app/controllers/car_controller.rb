
class CarController < ApplicationController

    before_action :set_locale

    def index
     @oResults=Car.all
    end

    def new
    end


    def create
        @car = Car.create(post_params)

          if @car.valid?

             ActionCable.server.broadcast "car_channel", message: @car.to_json
             redirect_to action: "index"
          else
            render :new
          end
    end


    def show

          @car = Car.find(params[:id])
    end

    def edit

          @car = Car.find(params[:id])
    end

    def update

          @car = Car.find(params[:id])
          if @car.update_attributes(post_params)
            redirect_to action: "index"
          else
            render :edit
          end

    end


    def destroy
       Car.find(params[:id]).delete
       redirect_to action: "index"
    end



    def post_params
      params.permit(:name,:user_id)
    end


    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

end
