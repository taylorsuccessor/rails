class CarController < ApplicationController

 #layout "public", :only => [ :index, :show ]
    def index
     @carList=Car.all
    end

    def new

    end


    def create
        @car = Car.create(post_params)
        print @car.valid?
          if @car.valid?
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

          car = Car.find(params[:id])
          if car.update_attributes(post_params)
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
      params.permit(:name)
    end
end
