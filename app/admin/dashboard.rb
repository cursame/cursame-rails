ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    #
=begin    
    columns do
      column do
        panel "Actividades de este mes" do
          render('/admin/dashboard_this_month_activities')
        end
        panel "Actividades de este anio" do
          render('/admin/dashboard_this_year_activities')
        end
        panel "Total de Actividades" do
          render('/admin/dashboard_total_activities')
        end
      end
    end
=end
    columns do
      column do
        panel "Cursos Recientes" do
          table_for Course.order("created_at desc").limit(10) do
            column :nombre do |course|
                link_to truncate("#{course.title}", :omission => "...", :length => 15), admin_course_path(course)
            end
            column :network do |course|
                truncate("#{course.network.name}", :omission => "...", :length => 28)
            end
            # column :init_date
          end
          strong { link_to "Ver todos los cursos ...", admin_courses_path}
        end
      end

      column do
        panel "Usuarios Recientes" do
          table_for User.order("created_at desc").limit(10) do
            column :email do |user|
                link_to truncate("#{user.email}", :omission => "...", :length => 15), admin_user_path(user)
            end
            column :nombre do |user|
                user.first_name + " " + user.last_name
            end
            column :role do |user|
                user.permissionings[0].role.title
            end
          end
          strong { link_to "Ver todos los usuarios ...", admin_courses_path}
        end
      end
      column do
        panel "Redes Recientes" do
          table_for Network.order("created_at desc").limit(10) do
            column :name 
            column :subdomain 
            column :population
          end
          strong { link_to "Ver todos las redes ...", admin_networks_path}
        end
      end
    end #end column
    
  end # content
end
