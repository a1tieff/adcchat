class CreateNextSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :next_steps do |t|
      t.integer :answer_id, required: true
      t.integer :step_id, required: true

      t.timestamps
    end
  end
end
