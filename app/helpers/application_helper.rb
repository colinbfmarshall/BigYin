module ApplicationHelper

  def owner(resource)
    resource.user == current_user
  end 

end
