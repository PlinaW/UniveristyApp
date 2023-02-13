module ApplicationHelper

  def session_link
    if (logged_in?)
      link_to "Logout", logout_path, data: { turbo_method: :delete}
    else
      link_to "Login", login_path
    end
  end

  def students_index
    if logged_in?
      link_to "Students", users_path
    end
  end

end
