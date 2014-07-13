class NotesController < ApplicationController

  def index
    notes = Note.all
    render json: notes.to_json
  end

  def show
    note = Note.find(params[:id])
    render json: note.to_json
  end

  def create
    note = Note.create(note_params)
    render json: note.to_json
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    render json: note.to_json
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    render json: note.to_json
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

end
