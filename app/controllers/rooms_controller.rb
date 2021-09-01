class RoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  include Trackable

  def index
    @rooms = @rooms.order('created_at DESC')
                   .search(filter)
                   .paginate(page: params[:page], per_page: 12)

    ahoy.track "Viewed Rooms"
  end

  def show
    @room = Room.find(params[:id])
    ahoy.track "Viewed Room: #{@room.name}", room_id: @room.id
  end

  def new
  end

  def edit
  end

  def create
    @room.user = current_user
    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy
    # Remove block if you want to put delete button in partial (warden issue)
    respond_to do |format|
      format.html { redirect_to rooms_path, notice: 'Room was successfully deleted.' }
    end
  end

  private

  def room_params
    params.require(:room).permit(:user_id, :name, :room_key)
  end

  def filter
    @filter = params[:q]
  end

end
