class Task
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :completed, type: Mongoid::Boolean, default: false

  validates :name, presence: true
end
