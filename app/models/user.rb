class User < ApplicationRecord
    has_secure_password

    has_many :task
    has_many :participants
    has_many :note

    validates :email, presence: true, uniqueness: true

    def accesible_tasks
        Task.where(owner_id: self.id)
    end
end
