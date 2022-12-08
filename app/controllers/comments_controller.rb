class CommentsController < ApplicationController
  
  def new
     @comment = Comment.new
     @comment.topic_id = params[:topic_id]
     @comment.user_id = current_user.id
  end
  
  # def index
  #   @comment_topics = current_user.comment_topics
  # end
  
  # def create
  #   topic = Topic.find(params[:topic_id])
  #   comment = current_user.comments.new(comment_params)
  #   comment.topic_id = topic.id
  #   comment.save
  #   redirect_to topic_path(topic)
  # end
  
  def create
    # binding.pry
    @comment = current_user.comments.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], topic_id: params[:topic_id] ).destroy
    redirect_to topic_path(params[:topic_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :comment)
  end
  
end
