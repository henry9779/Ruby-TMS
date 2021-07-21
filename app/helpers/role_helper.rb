# role_helper
module RoleHelper
  def options_for_role
    [
      [t('user'), 'user'],
      [t('admin'), 'admin']
    ]
  end
end
