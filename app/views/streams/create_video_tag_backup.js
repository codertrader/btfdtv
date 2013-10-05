$("#video-tags-list").html('');

<% @video.tags.each do |tag| %>
  $("#video-tags-list").append("<li id=\"tag-<%=tag.id%>\" style='display:inline;'><span class='btn btn-mini btn-normal'><a href='javascript:deleteVideoTag(\"<%=j(tag.name)%>\",\"tag-<%=tag.id%>\")' class=\"btn btn-mini btn-danger\"><i class=\"icon-remove\"></i></a>&nbsp;<%= escape_javascript(tag.name) %></span></li>");
<% end %>
