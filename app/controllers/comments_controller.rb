class CommentsController < ApplicationController
	def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.topic.course
    else

      redirect_to @comment.topic.course, :flash => { :warning => 'Something went wrong! Cannot post your comment' }
    end
    end

  private

    def comment_params
      params.require(:comment).permit(:content, :student_id, :topic_id)
                                   
    end
end
