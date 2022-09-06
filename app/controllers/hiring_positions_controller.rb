class HiringPositionsController < ApplicationController
    def index
        @hiring_positions = HiringPosition.all
      end
    def show
      @hiring_position = HiringPosition.find(params[:id])
    end

    def new
      @hiring_position = HiringPosition.new
    end

    def create
      @hiring_position = HiringPosition.new(hiring_position_params)
      if @hiring_position.save
        redirect_to @hiring_position
      else
        render :new, status: unprocessable_entity
      end
    end

    def edit
      @hiring_position = HiringPosition.find(params[:id])
    end

    def update
      @hiring_position = HiringPosition.find(params[:id])

      if @hiring_position.update(hiring_position_params)
        redirect_to @hiring_position
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy  
      @hiring_position = HiringPosition.find(params[:id])
      @hiring_position.destroy
      redirect_to root_path, status: :see_other 
    end

    private
    def hiring_position_params
      params.require(:hiring_position).permit(:name, :image)
    end

end
