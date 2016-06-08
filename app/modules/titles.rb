module Titles

  def hacky_title
    title.title
  end

  def to_param
    title.to_param
  end

  def slug
    self.title.slug
  end
end