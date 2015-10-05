class EntityValidator < ActiveModel::EachValidator
  def validate_each(permissioning, attributte, entity)
    if permissioning.role && permissioning.role.title == "mentor_link"
      unless entity && entity.to_s.length > 0
        permissioning.errors[attributte] << I18n.t('activerecord.errors.messages.invalid')
      end
    end
  end
end
