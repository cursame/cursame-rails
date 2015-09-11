class CreateUserLanguages < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.integer :user_id
      t.integer :language_id

      t.timestamps
    end

    add_index :user_languages, :user_id
    add_index :user_languages, :language_id
  end
end
