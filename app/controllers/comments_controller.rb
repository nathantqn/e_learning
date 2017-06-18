class CommentsController < ApplicationController
	def create
    @comment = Comment.new(comment_params)
    @topic_of_comment = @comment.topic
    if (!@topic_of_comment.is_final_exam) || (@topic_of_comment.is_final_exam and ((@topic_of_comment.created_at + @topic_of_comment.duration*60) > Time.zone.now))

    if @comment.save
			(@topic_of_comment.students.uniq - [current_user.student]).each do |student|
				Notification.create(recipient: student, actor: current_user.student, action: "posted", notifiable: @comment)
			end

			
      redirect_to @comment.topic.course

    else

      redirect_to @comment.topic.course, :flash => { :warning => 'Something went wrong! Cannot post your comment' }
    end

    elsif @topic_of_comment.is_final_exam and ((@topic_of_comment.created_at + @topic_of_comment.duration*60) < Time.zone.now)
    redirect_to @comment.topic.course, :flash => { :warning => 'Duration of Final Exam is expired!' }

    end
  end



  private

    def comment_params
      params.require(:comment).permit(:content, :student_id, :topic_id)

    end
end
