jQuery ($)->
  $("a[href='#{location.hash}']").tab('show') if location.hash?

  $(document).on "click", "a[data-toggle]", ->
    location.hash = @getAttribute("href")

$(window).on 'popstate', ->
  anchor = location.hash || $("a[data-toggle=tab]").first().attr("href")
  $("a[href='#{anchor}']").tab('show')