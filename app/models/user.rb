class User < ApplicationRecord
    has_many :task
    has_many :participants
    has_many :note
end
