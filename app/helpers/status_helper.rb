# status_helper
module StatusHelper
  def options_for_status
    [
      [t('pending'), 'pending'],
      [t('in_progress'), 'in_progress'],
      [t('completed'), 'completed']
    ]
  end
end
