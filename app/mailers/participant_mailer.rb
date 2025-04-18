# frozen_string_literal: true

class ParticipantMailer < ApplicationMailer
  def new_task_email
    @user = params[:user]
    @task = params[:task]
    mail to: @user.email, subject: 'You Have a New Task!'
  end
end
