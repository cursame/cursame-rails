class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channel_type
      t.string :channel_name

      t.timestamps
    end
  end
end
