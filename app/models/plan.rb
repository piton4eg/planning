class Plan < ActiveRecord::Base
  attr_accessible :done, :plan_date, :tags, :text

  validates :text, :plan_date, presence: true

  today = Date.today()
  beginning_of_week = DateTime.now.beginning_of_week()
  scope :today_plans, where("plan_date >= ?", today)
  scope :week_plans, where("plan_date >= ? and plan_date < ?", beginning_of_week, today)
  scope :other_plans, where("plan_date < ?", beginning_of_week)

  def self.where_id(id)
    where(id: id).first
  end
end
