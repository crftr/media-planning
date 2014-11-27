root = exports ? this

# Configures single date pickers... and a required callback for Rails
root.singleDaterangePicker = (name) ->
  $("." + name).daterangepicker
    singleDatePicker: true,
    minDate: '01-01-2005',
    maxDate: '01-01-2020',
    startDate: moment(),
    showDropdowns: true,
  , (start, end, label) ->
    $('#' + name + '_alt').val(start.format('YYYY-MM-DD'))