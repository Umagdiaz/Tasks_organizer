class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :task

  ROLES = {
    responsible: 1,
    follower: 2
  }

  
  
  def self.roles
    ROLES
  end
end
