class Plan < ActiveRecord::Base
  attr_accessible :done, :plan_date, :tags, :text

  validates :text, :plan_date, presence: true
end
