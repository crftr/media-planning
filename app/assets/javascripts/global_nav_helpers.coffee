root = exports ? this

# Global navigation assistance.  Given a specific sidebar element, make it
# active, and open its parent accordian.
#
root.showSidebarItem = (sidebarId) ->
  $sidebar = $('.cl-sidebar .cl-vnavigation')
  $('ul', $sidebar).hide()
  $('li', $sidebar).removeClass('active').removeClass('open')
  $('li#' + sidebarId).addClass('active').parent('ul').show().parent().addClass("open");
