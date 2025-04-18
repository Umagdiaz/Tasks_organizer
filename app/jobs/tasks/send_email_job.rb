# frozen_string_literal: true

module Tasks
  class SendEmailJob
    include SuckerPunch::Job

    def perform(task_id)
      task = Task.find(task_id)
      Tasks::SendEmail.new.call(task)
    end
  end
end
