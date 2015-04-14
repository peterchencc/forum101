class CommentsController < ApplicationController

  before_action :set_topic

  def create
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "回覆成功"
      redirect_to topic_path(@topic)
    else
      render :template => "topics/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
