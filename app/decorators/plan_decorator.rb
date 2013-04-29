# coding: utf-8
class PlanDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def plan_date
    model.plan_date.to_date.to_s if !model.plan_date.blank?
  end

  def legend
    "№#{id} от #{plan_date}"
  end

  def tags
    if !model.tags.blank?
      h.content_tag :div, model.tags, class: 'plan_tags'
    end
  end

  def show_link
    h.link_to model.text, h.plan_path(model)    
  end

  def edit_link
    h.link_to "Редактировать", h.edit_plan_path(model), class: 'btn btn-success'
  end

  def delete_link
    h.link_to "Удалить", h.plan_path(model), method: :delete, data: { confirm: "Вы уверены?" }, class: 'btn btn-danger'
  end

end
