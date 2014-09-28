class AddInterviewIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :interview, :integer
  end
end
