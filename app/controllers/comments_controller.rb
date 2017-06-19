class CommentsController < ApplicationController
	def create
    @comment = Comment.new(comment_params)
    @topic_of_comment = @comment.topic
    if (!@topic_of_comment.is_final_exam) || (@topic_of_comment.is_final_exam and ((@topic_of_comment.created_at + @topic_of_comment.duration*60) > Time.zone.now))

    if @comment.save
			(@topic_of_comment.students.uniq - [current_user.student]).each do |student|
				notification = Notification.create(recipient: student, actor: current_user.student, action: "posted", notifiable: @comment)
				ActionCable.server.broadcast "room_channel_user_#{student.user_id}",
	                                   noti: true,
																		 message:
																		 "#{notification.actor.user.generalinfo.first_name} #{notification.action} a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"

			end






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
