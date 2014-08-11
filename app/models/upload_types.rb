require 'csv'
module UploadTypes
  def self.mimes_hash
    @mimes ||= Hash.new{|h, k| h[k] = []}
  end

  def self.extensions_hash
    @exts_hash ||= Hash.new{|h,k| h[k] = []}
  end

  def self.mimes_for(type)
    mimes_hash[type]
  end

  def self.extensions_for(type)
    extensions_hash[type]
  end

  def self.add_file(filename)
    CSV.foreach(filename, headers: true) do |row|
      mimes_hash[row['type']] << row['mime_type']
      extensions_hash[row['type']] << row['extension']
    end
  end
end