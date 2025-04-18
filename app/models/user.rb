# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_tasks, class_name: 'Task'
  has_many :participations, class_name: 'Participant'
  has_many :tasks, through: :participations

  def tasks
    participations.includes(:task).map(&:task)
  end
end
