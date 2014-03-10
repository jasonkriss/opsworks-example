class NotesController < ApplicationController
  def index
    render json: Note.all
  end

  def show
    note = Note.find(params[:id])
    render json: note
  end

  def create
    note = Note.new(note_params)

    if note.save
      render json: note, status: :created
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def update
    note = Note.find(params[:id])

    if note.update_attributes(note_params)
      render json: note
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    head :no_content
  end

  private
  def note_params
    params.require(:note).permit(:title, :body)
  end
end
