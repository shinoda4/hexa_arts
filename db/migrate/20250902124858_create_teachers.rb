class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :gender
      t.string :position
      t.text :award_certificates
      t.text :honors
      t.string :teacher_license
      t.text :bio
      t.text :experience
      t.string :phone
      t.string :wechat
      t.references :school, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
