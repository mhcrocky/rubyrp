class RoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @rooms = @rooms.order('created_at DESC').
                    search(filter).
                    paginate(page: params[:page], per_page: 12)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @room.user = current_user #.id gives Fixnum instead of User
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_path(@room), notice: 'Room was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy
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
