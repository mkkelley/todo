class Task
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :completed, type: Mongoid::Boolean, default: false
  field :created_at, type: DateTime, default: -> { Time.now }

  validates :name, presence: true
end
