hasQueryVariable = (variable)->
  query = window.location.search.substring(1)
  queryVars = query.split("&")
  for queryVar in queryVars
    queryKv = queryVar.split("=")
    if queryKv[0] == variable

      #Return true as soon as we find the variable nam
      return true

  #Return false if variable name not found
  return false

jQuery ($)->
  if hasQueryVariable('page')
    $("#tabs a[href='#history-tab']").tab('show')