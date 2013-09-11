module ApplicationHelper

  def avatar_url(contributor)
    gravatar_id = Digest::MD5.hexdigest(contributor.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end
