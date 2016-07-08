module CategoryClassExtensions

  def get_categories
    f = Rails.root.join(ENV['CATEGORIES_FILE_RELATIVE_PATH'])
    cats = YAML.load( File.open(f) )
    cats[0].to_a[0][1].map{|c| c.to_a[0]}.map{|c| [c[0], :isa, c[1]]}
  end

  def get_matches(subject=nil, predicate=nil, object=nil)
    get_categories.select{ |t| subject ? subject==t[0] : true }.select{ |t| predicate ? predicate==t[1] : true }.select{ |t| object ? object==t[2] : true }
  end

end
