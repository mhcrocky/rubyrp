class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    render json: @rooms.order('created_at DESC')
  end

  def show
    render json: Room.find(params[:id])
  end

  def create
    @room.user = current_user #.id gives Fixnum instead of User
    respond_to do |format|
      if @room.save
        format.json { render json: @room, status: :created }
      else
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.json { render json: @room, status: :ok }
      else
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def room_params
      params.require(:room).permit(:user_id, :name, :room_key)
    end

end
