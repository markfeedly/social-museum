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

  def ld_trail(subject, predicate)
    parent = ld_relation(subject,predicate)
    if parent
      ld_trail(parent[2], predicate).unshift(subject)
    else
      [subject]
    end
  end

  def ld_relation(subject, predicate)
    ld_categories.find{|t| t[0..1] == [subject, predicate]}
  end

  def ld_inverse_relations(object, predicate)
    ld_categories.find_all{ |t| t[1] == predicate && t[2] == object }
  end

  def ld_inverse_set(object, predicate)
    ([object] + ld_inverse_relations(object, predicate).map{|cat| ld_inverse_set(cat[0], predicate)}).flatten.sort
  end

  def ld_page_in_inverse_set(object, predicate)
    categories.split(',').any? do |cat|
      ld_inverse_set(object, predicate).include?(cat)
    end
  end
end