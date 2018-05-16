require "kafka"
require "kafka/datadog"

class CarController < ApplicationController


    before_action :set_locale

    def set_locale
       I18n.locale = params[:locale] || I18n.default_locale
        # I18n.default_locale= :ar
    end




    #layout "public", :only => [ :index, :show ]
    def index

kafka = Kafka.new(["localhost:9092"], client_id: "my-application")
kafka.deliver_message("Hello, World!", topic: "greetings")



Kafka::Datadog.namespace = "custom-namespace"

# Default is "127.0.0.1".
Kafka::Datadog.host = "statsd.something.com"

# Default is 8125.
Kafka::Datadog.port = 1234

#kafka.each_message(topic: "greetings") do |message|
#  puts message.offset, message.key, message.value
#end

     @oResults=Car.all
    end

    def new

    end


    def create
        @car = Car.create(post_params)

          if @car.valid?
             ActionCable.server.broadcast "car_channel", message: "new car created #{@car.id}"
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
end
