jQuery ($)->
  $(document).on 'click', '[data-role="clear-file"]', (e)->
    $("input[type=file]").val("")
    e.preventDefault()

  $(document).on 'click', '[data-role="toggle-field"]', (e)->
    if $('[data-role="toggle-field"]').text() == "Submit a link instead"
      $('[data-role="toggle-field"]').text('Upload a file instead')
      $('[data-role="upload-field"]').toggle('slideUp', -> $('[data-role="link-field"]').toggle('slideDown'))
    else
      $('[data-role="toggle-field"]').text('Submit a link instead')
      $('[data-role="link-field"]').toggle('slideUp', -> $('[data-role="upload-field"]').toggle('slideDown'))
    e.preventDefault()