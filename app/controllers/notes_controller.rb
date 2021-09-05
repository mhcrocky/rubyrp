class NotesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  before_action :set_room

  def new
    @note = @room.notes.new
  end

  def create
    # @note.user = current_user
    @note = @room.notes.create!(note_params)
    respond_to do |format|
      if @note.save
        format.turbo_stream
        format.html { redirect_to @room }
      else
        format.html { render action: 'new' }
      end
    end

    # @note = @room.notes.create!(note_params)
    # @note.user = current_user
    # respond_to do |format|
    #   if @comment.save
    #     format.turbo_stream
    #     format.html { redirect_to @room }
    #   end
    # end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def note_params
    params.require(:note).permit(:body)
  end

end
