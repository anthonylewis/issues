class NotesController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @note = @issue.notes.build(params[:note])
    @note.user = current_user
    @note.save
    redirect_to issue_path(@issue)
  end
end
