class CreateMajors < ActiveRecord::Migration[8.0]
  def change
    create_table :majors do |t|
      t.string :major_name

      t.timestamps
    end
  end
end
