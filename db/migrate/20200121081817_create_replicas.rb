class CreateReplicas < ActiveRecord::Migration[6.0]
  def change
    create_table :replicas do |t|
      t.integer :position, required: true
      t.integer :step_id, required: true
      t.string :type, required: true
      t.integer :timeout, required: true, default: 1000
      t.string :phrase
      t.string :image

      t.timestamps
    end
  end
end
