class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :silabus
      t.datetime :init_date
      t.datetime :finish_date

      t.timestamps
    end
  end
end
