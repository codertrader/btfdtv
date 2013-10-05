$("#video-tags-list").html('');

<% @video.tags.each do |tag| %>
  $("#video-tags-list").append("<li id=\"tag-<%=j(tag.name)%>\"><a href='javascript:deleteVideoTag(\"<%=j(tag.name)%>\")'>[X]</a>&nbsp;<%= escape_javascript(tag.name) %></li>");
<% end %>
