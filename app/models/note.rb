# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :body, presence: true
end
