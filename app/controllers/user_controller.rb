class UserController < ApplicationController

 #layout "public", :only => [ :index, :show ]
    def index
     @userList=User.all
    end

    def new

    end


    def create
        @user = User.create(post_params)
        print @user.valid?
          if @user.valid?
            redirect_to action: "index"
          else
            render :new
          end
    end


    def show

          @user = User.find(params[:id])
    end

    def edit

          @user = User.find(params[:id])
    end

    def update

          user = User.find(params[:id])
          if user.update_attributes(post_params)
            redirect_to action: "index"
          else
            render :edit
          end

    end


    def destroy
       User.find(params[:id]).delete
       redirect_to action: "index"
    end



    def post_params
      params.permit(:name)
    end
end
