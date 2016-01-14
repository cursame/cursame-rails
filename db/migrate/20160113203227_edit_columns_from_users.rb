class EditColumnsFromUsers < ActiveRecord::Migration
  def change
    User.all.each do |user|
      if user.sign_in_count > 0
        user.onboarding = true
        user.save
      end
    end
  end
end
