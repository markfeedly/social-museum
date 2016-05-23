module Tags

  def set_tags_from_string str
    desired_tags = str.split(',').collect{|t| t.strip.squeeze(' ')}.sort.uniq.reject{|t|t==''}
    tags.destroy_all
    set_tags(desired_tags)
  end

  def tags_as_arr
    self.tags.collect{|t| t.name}
  end

  def tags_as_str
    self.tags.collect{ |tag|tag.name.strip.squeeze(' ')}.sort.join(', ')
  end

  def has_tag?(tag)
    tags.collect{|t| t.name }.include?(tag)
  end

  private

  def set_tags(tags)
    tags.each do |nme|
      existing_tag = Tag.where(name: nme).first
      if existing_tag.present?
        self.tags << existing_tag
      else
        self.tags << Tag.new(name: nme)
      end
    end
  end

end