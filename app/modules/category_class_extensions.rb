module CategoryClassExtensions

  def find_categorized(cat, type)
    cat_as_str = cat.class == String ? cat : cat.name
    type.select{ |ci| ci.has_category?(cat_as_str) }
  end

  def find_categorized_including_child_categories(cat, type)
    cat_as_str = cat.class == String ? cat : cat.name
    type.select{ |ci| Category.get_children(:isa, cat_as_str).find{|c| ci.has_category?(c)} }
  end

  def get_children(predicate, root)
    matched_triples = Category.get_matches(nil, predicate, root)
    return [root] unless matched_triples
    matches = matched_triples.collect{ |t| t[0] }
    non_unique = matches.collect{|child| get_children(predicate, child)}.flatten
    Set.new(non_unique+[root]).to_a.sort
  end

  def get_matches(subject=nil, predicate=nil, object=nil)
    get_categories.select{ |t| subject ? subject==t[0] : true }.select{ |t| predicate ? predicate==t[1] : true }.select{ |t| object ? object==t[2] : true }
  end

  def get_categories
    f = Rails.root.join(ENV['CATEGORIES_FILE_RELATIVE_PATH'])
    cats = YAML.load( File.open(f) )
    cats[0].to_a[0][1].map{|c| c.to_a[0]}.map{|c| [c[0], :isa, c[1]]}
  end

end
