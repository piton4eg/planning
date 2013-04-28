#coding: utf-8
class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :text, default: "Введите текст", null: false      
      t.datetime :plan_date, default: Date.today(), null: false      
      t.boolean :done, default: false, null: false      
      t.string :tags, default: "план", null: false

      t.timestamps
    end
  end
end
