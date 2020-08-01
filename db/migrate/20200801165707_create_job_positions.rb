class CreateJobPositions < ActiveRecord::Migration[6.0]
  def change
    create_table(:job_positions) do |t|
      t.string(:title, null: false)
      t.string(:description, null: false)
      t.boolean(:active, null: false, default: :false)

      t.timestamps
    end
  end
end
