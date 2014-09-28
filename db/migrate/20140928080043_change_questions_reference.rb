class ChangeQuestionsReference < ActiveRecord::Migration
  def change
    change_column :questions, :interview,  :string
  end
end
