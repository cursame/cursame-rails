ActiveAdmin.register User do
 index do
    column :email
    column :first_name
    column :last_name
    column :personal_url
    column :domain
    column :subdomain
    column :confirmed_at
    column :accepted_terms
    column :online
    column :password
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Course Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :accepted_terms
    end
    f.actions
  end
end
