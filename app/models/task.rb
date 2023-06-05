class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user
  has_many :notes, dependent: :destroy

  #validates :participating_users, presence: true
  validates :name, :description, presence: true
  validates :name, uniqueness: { case_insensitive: false }
  validate :due_date_validay

  accepts_nested_attributes_for :participating_users, reject_if: :all_blank, allow_destroy: true

  def due_date_validay
    return if due_date.blank?
    return if due_date >= Date.today
    errors.add :due_date
  end
end
