class CreateMasiveMailerForSuperAdmins < ActiveRecord::Migration
  def change
    create_table :masive_mailer_for_super_admins do |t|
      t.string :key_m
      t.string :title
      t.text :message
      t.integer :number_of_users
      t.text :array_hash_from_sended

      t.timestamps
    end
  end
end
