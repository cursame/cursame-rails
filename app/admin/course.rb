ActiveAdmin.register Course do
 index do
    column :title
    column :silabus
    column :init_date
    column :finish_date
    column :active_status
    default_actions
  end

  filter :title
  filter :init_date
  filter :finish_date
  filter :active_status

  form do |f|
    f.inputs "Course Details" do
      f.input :title
      f.input :silabus
      f.input :network_id, :as => :select, :collection => Hash[Network.all.map{|b| [b.name,b.id]}]
    end
    f.actions
  end
end
