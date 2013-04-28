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
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(params[:plan])
      flash[:success] = 'Изменения сохранены'
      redirect_to plan_path(@plan)
    else
      render 'edit'      
    end
  end

  def index
    @today_plans = Plan.where("plan_date >= ?", Date.today()) 
    @week_plans = Plan.where("plan_date >= ? and plan_date < ?", DateTime.now.beginning_of_week(), Date.today())
    @other_plans = Plan.where("plan_date < ?", DateTime.now.beginning_of_week())
  end

  def destroy
    Plan.find(params[:id]).destroy
    flash[:success] = 'Спринт успешно удален'
    redirect_to root_path
    
  end
end