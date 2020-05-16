module NavigationHelper
  def nav_active_class(controller)
    params[:controller] == controller ? 'active' : ''
  end
end
