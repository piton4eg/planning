class ChangeNullToPlansTags < ActiveRecord::Migration
  def change
    change_table :plans do |t|
      t.change :tags, :string, default: '', null: true
    end
  end
end
