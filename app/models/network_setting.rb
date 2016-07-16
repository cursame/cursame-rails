class NetworkSetting < ActiveRecord::Base
  belongs_to :network
  validates_associated :network
  validates :property, presence: true
  validates :value, presence: true

  PROPERTY = {
    # show/hide course publications in main wall, values: 't' | 'f'
    hide_course_publications_in_main_wall: 'hide_course_publications_in_main_wall',
    # show/hide vLex SSO link, values: true | false
    vlex_sso: 'vlex_sso',
    # see page 7 from 'doc/guia de ususario vLex México.pdf' for vlex sso settings
    vlex_account_id: 'vlex_account_id',
    vlex_name: 'vlex_name',
    vlex_token: 'vlex_token',
    vlex_email: 'vlex_email'
  }

end
