# frozen_string_literal: true

module Tasks
  class TriggerEvent
    def call(task, event)
      task.send "#{event}!"
      [true, 'successful']
    rescue StandardError => e
      Rails.logger.error e
      [false, 'failed']
    end
  end
end
