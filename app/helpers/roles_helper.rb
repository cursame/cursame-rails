module RolesHelper
  def options_for_select_roles(user)
    roles_options = Role.all.map { |role| [ I18n.t("roles.#{role.title}"), role.id] }
    options_for_select(roles_options, user.permissionings.first.role_id)
  end
end
