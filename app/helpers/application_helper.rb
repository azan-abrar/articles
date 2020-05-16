module ApplicationHelper
  def get_flash_key(key)
    key == 'alert' ? 'danger' : 'success'
  end
end
