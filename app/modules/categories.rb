module Categories

  def set_categories_from_string str
    desired_categories = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    categories.destroy_all
    set_categories(desired_categories)
  end

  def categories_as_arr
    self.categories.collect{|t| t.name}
  end

  def categories_as_str
    self.categories.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end

  def has_category?(tag)
    self.categories.collect{|t| t.name }.include?(tag)
  end

  def in_categories_and_children?(object)
    return false unless categories.any?
    found = false
    categories.each do |cat|
      found = true if Category.category_and_children(object).include?(cat.name)
    end
    found
  end

  private

  def set_categories(categories)
    categories.each do |nme|
      existing_category = Category.where(name: nme).first
      if existing_category.present?
        self.categories << existing_category
      else
        self.categories << Category.new(name: nme)
      end
    end
  end

end