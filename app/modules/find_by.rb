module FindBy

  def find_by_slug(slug)
    joins(:title).where(titles: {slug: slug}).first
  end

  def find_by_title(title)
    joins(:title).where(titles: {title: title}).first
  end

end