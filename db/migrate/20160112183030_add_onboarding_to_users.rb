class AddOnboardingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :onboarding, :boolean, default: false
  end
end
