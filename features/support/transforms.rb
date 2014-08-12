CAPTURE_ITEM_RECENCY = Transform /^(|second|third) ?most recent$/ do |position|
  index = 0 if position == ""
  index = 1 if position == "second"
  index = 2 if position == "third"
  index
end

CAPTURE_EMAIL_COUNT = Transform /^(once|one time|no times|\d+ times)$/ do |count|
  case count
  when "no times"
    0
  when "once" || "one time"
    1
  when /\d+ times/
    count.split(' ')[0].to_i
  end
end