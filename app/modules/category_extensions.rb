module CategoryExtensions
  def self.included(base)
    base.extend(self)
  end

  #todo refactor out this crud, most or all to go

  def get_categories
    Category.get_categories
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

  def category_and_children(object)
    ([object] + category_inverse_relations(object, :isa).map{|cat| category_and_children(cat[0])}).flatten.sort
  end

  def in_category_and_its_children?(str)
    cats = category_and_children(str)
    found = false
    cats.each{|c| found = true if has_category?(c) }
    found
  end

end