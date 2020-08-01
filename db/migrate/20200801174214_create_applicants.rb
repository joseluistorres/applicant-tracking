class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table(:applicants) do |t|
      t.string(:first_name, null: false)
      t.string(:last_name, null: false)
      t.string(:email, null: false)
      t.string(:bio, null: false)
      t.datetime(:date_applied, null: false)
      t.references(:job_position, null: false, foreign_key: true)
      t.datetime(:deleted_at)

      t.timestamps
    end
  end
end
