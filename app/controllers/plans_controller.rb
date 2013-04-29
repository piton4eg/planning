#coding: utf-8
class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params[:plan])
    if @plan.save
      flash[:success] = "Новый план успешно сохранен!"
      redirect_to @plan
    else
      render 'new'      
    end
  end

  def show
    @plan = PlanDecorator.decorate(Plan.where_id(params[:id]))
  end

  def edit
    @plan = PlanDecorator.decorate(Plan.where_id(params[:id]))
  end

  def update
    @plan = PlanDecorator.decorate(Plan.where_id(params[:id]))
    if @plan.update_attributes(params[:plan])
      flash[:success] = 'Изменения сохранены'
      redirect_to plan_path(@plan)
    else
      render 'edit'      
    end
  end

  def index
    @today_plans = PlanDecorator.decorate_collection(Plan.today_plans)
    @week_plans = PlanDecorator.decorate_collection(Plan.week_plans)
    @other_plans = PlanDecorator.decorate_collection(Plan.other_plans)
  end

  def destroy
    Plan.where_id(params[:id]).destroy
    flash[:success] = 'Спринт успешно удален'
    redirect_to root_path    
  end
end