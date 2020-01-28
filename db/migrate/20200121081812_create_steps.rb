class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.boolean :opening, required: true
      t.boolean :gift, required: true

      t.timestamps
    end
  end
end
