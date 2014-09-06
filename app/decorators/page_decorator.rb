class PageDecorator < Draper::Decorator
  delegate_all

  # contents tab

  def categories_as_arr
    categories == '' ? [] : categories.split(',').collect{|t| t.strip}
  end

  def tags_as_arr
    tags == '' ? [] : tags.split(',').collect{|t| t.strip}
  end

# used in conflicting edits
  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end

end