# role_helper
module RoleHelper
  def options_for_role
    [
      [t('to_user'), 'user'],
      [t('to_admin'), 'admin']
    ]
  end
end
