class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def new
    @note = @room.notes.new
  end

  def create
    @note      = @room.notes.create(note_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.turbo_stream
        format.html { redirect_to @room }
        format.js
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def note_params
    params.require(:note).permit(:user_id, :room_id, :body)
  end

end
