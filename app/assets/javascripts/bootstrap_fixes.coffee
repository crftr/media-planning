
# Fixes jquery datepicker closing its parent Bootstrap modal
#
# http://stackoverflow.com/questions/21059598/implementing-jquery-datepicker-in-bootstrap-modal
#
enforceModalFocusFn = $.fn.modal.Constructor::enforceFocus

$.fn.modal.Constructor::enforceFocus = ->

try
  $confModal.on "hidden", ->
    $.fn.modal.Constructor::enforceFocus = enforceModalFocusFn
    return
  $confModal.modal backdrop: false
catch error
  if error.name != 'ReferenceError'
    throw error