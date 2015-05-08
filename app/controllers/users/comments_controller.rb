class Users::CommentsController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.username = current_user.username
    @comment.lyric_id = Lyric.friendly.find(params[:lyric_id]).id
    if @comment.save
      flash[:notice] = "Thanks for translating your beautiful thoughts into words and posting them here!"
      redirect_to (:back)
    else
      flash[:alert] = "You probably forgot to write something? Yeah, that's it!"
      redirect_to (:back)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to (:back)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
