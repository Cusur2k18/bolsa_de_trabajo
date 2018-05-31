class CreateJoinTableJobJobType < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :job_types do |t|
       t.index [:job_id, :job_type_id]
       t.index [:job_type_id, :job_id]
    end
  end
end
