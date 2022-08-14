module ApplicationHelper
  def home_index?
    controller_name == 'home' && action_name == 'index'
  end
end
