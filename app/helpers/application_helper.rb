module ApplicationHelper
  def alert_class(original, result)
    return 'alert' if result.blank?
    return 'success' if original == result
    'warning'
  end

  def alert_text(original, result)
    return 'Література не знайдена' if result.blank?
    return 'Література указана вірно' if original == result
    'Література указана не точно'
  end
end
