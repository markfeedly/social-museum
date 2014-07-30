CAPTURE_ITEM_RECENCY = Transform /^(|second|third) ?most recent$/ do |position|
  index = 0 if position == ""
  index = 1 if position == "second"
  index = 2 if position == "third"
  index
end