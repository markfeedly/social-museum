class PageDecorator < Draper::Decorator
  delegate_all

# used in conflicting edits
  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end

end