class PageState < ActiveRecord::Base

  default_scope -> { order('created_at ASC') }

  belongs_to :page

=begin
  before_validation(:on => :create) do
    TODO dave changed here - think about
    self.title = cleanit(title)
    attributes['content'] = cleanit(attributes['content'])
  end
=end

  validate :uniqueish_title
  validates :title,   presence: {allow_blank: false }
  validates :content, presence: {allow_blank: false }
  validates :tags,    presence: {allow_blank: true }

  belongs_to :user

  private

  def cleanit(str)
    #TODO improve sanitisation
    #semi_cleaned_str = ( str.gsub(/>/,'.>') || str )
    #semi_cleaned_str.gsub(/</,'&lt;') || semi_cleaned_str
  end

  #TODO change needed here if want to allow re-use of old titles that aren't currently in use
  def uniqueish_title
    if PageState.where(title: self.title).where.not(page_id: self.page_id).exists?
      errors.add :title, "is in use"
    end
  end
end
