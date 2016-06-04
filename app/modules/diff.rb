module FindBy

  def compare_versions(previous, current)
    Diffy::Diff.new(previous, current).to_s(:html)
  end

end