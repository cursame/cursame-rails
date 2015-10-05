class RoleIdentifier

  def initialize(title)
    @title = title.downcase
  end

  def detect_role
    if @title == student
      role_id =  Role.find_by_title("student").id
    elsif @title == teacher
      role_id = Role.find_by_title("teacher").id
    else
      role_id = ""
    end

    role_id
  end

  private

  def student
    I18n.t('roles.student').downcase
  end

  def teacher
    I18n.t('roles.teacher').downcase
  end

end
