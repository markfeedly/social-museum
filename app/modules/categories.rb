module Categories

  def set_categories_from_string str
    desired_categories = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    set_categories(desired_categories)
  end

  def categories_as_arr
    categories.collect{|t| t.name}
  end

  def categories_as_str
    categories.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end

  def has_category?(cat)
    categories.include?(Category.find_by(name: cat))
  end

  def in_categories_and_children?(target_category)
    return false unless categories.any?
    found = false
    categories.each do |cat|
      found = true if Category.category_and_children(target_category).include?(cat.name)
    end
    found
  end

  private

  def set_categories(desired_categories)
    categories.each do |exist_cat|
      name = exist_cat.name
      if desired_categories.include?(name)
        desired_categories.delete(name)
      else
        categories.delete(exist_cat)
      end
    end
    desired_categories.each  do |desired_name|
      cat = Category.find_by(name: desired_name)
      if cat
        self.categories << cat
      else
        self.categories << Category.new(name: desired_name)
      end
    end
  end

end