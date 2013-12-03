ActiveAdmin.register AdminMessage do
  index do
    column :title
    column :text
    column :status
    column :dom_id
    column :position
    default_actions
  end

  filter :title
  filter :status
  filter :dom_id

  form do |f|
    f.inputs "Admin Messages" do
      f.input :title
      f.input :text
      f.input :status
      f.input :dom_id
      f.input :position, :as => :select, :collection => ['top','left','right','bottom']
    end
    f.actions
  end
end
