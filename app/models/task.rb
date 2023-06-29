class Task < ApplicationRecord
  include AASM

  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many_attached :files

  validates :participating_users, presence: false
  validates :name, :description, presence: true
  validates :name, uniqueness: { case_insensitive: false }
  validate :due_date_validay

  after_create :send_email
  accepts_nested_attributes_for :participating_users, allow_destroy: true, reject_if: :all_blank

  aasm column: :status do
    state :pending, initial: true
    state :in_process, :finished

    after_all_transitions :audit_status_change

    event :start do
      transitions from: :pending, to: :in_process
    end

    event :finish do
      transitions from: :in_process, to: :finished
    end
  end

  def audit_status_change
    puts "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
    set transitions: transitions.push(
      {
        from_state: assm.from_state,
        to_state: assm.to_state,
        current_event: assm.current_event,
        timestamp: Time.zone.now
      }
    )
  end

  def participants
    participating_users.includes(:user).map(&:user)
  end
  
  def due_date_validay
    return if due_date.blank?
    return if due_date >= Date.today
    errors.add :due_date
  end

  def send_email
    return if Rails.env.development?
    Tasks::SendEmailJob.perform_async(self.id)
  end
end
