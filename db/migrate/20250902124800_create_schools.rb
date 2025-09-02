class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :address

      t.timestamps
    end
  end
end
