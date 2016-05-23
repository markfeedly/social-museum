module CategoryExtensions
  def self.included(base)
    base.extend(self)
  end

  def get_categories
    [ ['Ferranti Mark I', :isa, 'Computer'],
      ['MU5', :isa, 'Computer'],
      ['Atlas', :isa, 'Computer'],
      ['VUM Atlas', :isa, 'Atlas'],
      ['Hardware', :is_part_of, 'Computer'],
      ['Software', :is_part_of, 'Computer'],
      ['Memory', :is_part_of, 'Hardware'],
      ['Disc Drive', :is_part_of, 'Hardware'],
      ['CPU', :is_part_of, 'Hardware']
    ]
  end

  def category_trail(subject, predicate)
    parent = category_relation(subject,predicate)
    if parent
      category_trail(parent[2], predicate).unshift(subject)
    else
      [subject]
    end
  end

  def category_relation(subject, predicate)
    get_categories.find{|t| t[0..1] == [subject, predicate]}
  end

  def category_inverse_relations(object, predicate)
    get_categories.find_all{ |t| t[1] == predicate && t[2] == object }
  end

  def category_inverse_set(object, predicate)
    ([object] + category_inverse_relations(object, predicate).map{|cat| category_inverse_set(cat[0], predicate)}).flatten.sort
  end

  def categorised_in_inverse_set?(object, predicate)
    return nil unless categories.any?
    categories.each do |cat|
      category_inverse_set(object, predicate).include?(cat.name)
    end
  end
end