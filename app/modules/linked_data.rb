module LinkedData
  def self.included(base)
    base.extend(self)
  end

  def ld_page_type
    [  ['Collection item', :isa, 'Type'],
       ['Person', :isa, 'Type'],
       ['Other', :isa, 'Type']
    ]
  end

  def ld_page_types
    ld_page_type.collect{|triple| triple[0] }.join(', ')
  end

  def ld_categories
    [ ['Ferranti Mark I', :isa, 'Computer'],
      ['MU5', :isa, 'Computer'],
      ['Atlas', :isa, 'Computer'],
      ['MU6G', :isa, 'Computer'],
      ['The baby', :isa, 'Computer'],
      ['Manchester Mark 1', :isa, 'Computer'],
      ['Hardware', :is_part_of, 'Computer'],
      ['Software', :is_part_of, 'Computer'],
      ['Memory', :is_part_of, 'Hardware'],
      ['Disc Drive', :is_part_of, 'Hardware'],
      ['CPU', :is_part_of, 'Hardware'],
      ['Zorg', :isa, 'Atlas'] ]
  end

  def ld_all_included_pages(object, predicate)
    ld_categories.find_all{|t| t[1] == predicate && t[1] == object }
  end

  def ld_trail(subject, predicate)
    parent = ld_categories.find{|t| t[0]==subject &&  t[1] == predicate}
    if parent
      ld_trail(parent[2], predicate).unshift(subject)
    else
      [subject]
    end
  end

  def ld_trails(categories, predicate)
    categories.split(',').collect { |c| ld_trail(c.strip, predicate) }
  end

  def ld_assert(start_subject, predicate, end_object)
    trail = ld_trail(start_subject, predicate)
    return false unless (s_index = trail.index start_subject)
    return false unless (o_index = trail.index end_object)
    o_index < s_index
  end

  def ld_inverse_set(highest_object, predicate)
    cats = ld_categories.find_all{|t| t[1] == predicate && t[2] == highest_object }
    res = cats.collect{|t| t[0] }
    #TODO sort put uniq - remove it and see what happens
    [highest_object].concat(res.concat(res.each.collect{|c| ld_inverse_set(c, predicate) }.flatten.reject{|c| c == nil })).uniq
  end

  def ld_page_in_inverse_set(highest_object, predicate)
    cats = categories.split(',').collect { |c| c.strip }
    cats_set = ld_inverse_set(highest_object, predicate)
    cats.each { |c| return true if cats_set.include?(c) }
    false
  end
end