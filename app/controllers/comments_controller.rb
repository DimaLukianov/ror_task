class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to placement_path(@comment.placement), flash: { success: I18n.t('comment.created') } }
      else
        format.html { redirect_to placement_path(@comment.placement), flash: { alert: I18n.t('comment.create_error') }}
      end
    end
  end

  def destroy
    if @comment
      @placement = @comment.placement
      if @comment.destroy
        redirect_to placement_path(@placement), flash: { success: I18n.t('comment.deleted') }
      else
        redirect_to placement_path(@placement), alert: I18n.t('comment.delete_error')
      end
    else
      redirect_to placements_path, alert: I18n.t('comment.undefined')
    end
  end

private
  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :body,
      :placement_id,
      {images: []}
    ).merge(user_id: current_user.id)
  end
end
