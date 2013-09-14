module ApplicationHelper

  def avatar_url(contributor)
    gravatar_id = Digest::MD5.hexdigest(contributor.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&rating=x"
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def current_user_is_admin
    current_user && current_user.admin == 1
  end

end
