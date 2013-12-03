ActiveAdmin.register Network do
  index do
    column :name
    column :subdomain
    column :created_at
    column :population
    default_actions
  end

  filter :name
  filter :subdomain
  filter :population

  form do |f|
    f.inputs "Network  Details" do
      f.input :name
      f.input :subdomain
      f.input :population
      f.input :welcom_message
    end
    f.actions
  end
end
