module PagesHelper
  
  def make_initalised_page(pg_str)
    pg = Page.new
    pg.description = File.read(Rails.root.join("config/initial_pages/#{pg_str}.md"))
    pg.title = Title.create(title: "#{pg_str.capitalize}")
    pg.name = "SPECIAL: #{pg_str.capitalize}"
    pg.set_tags_from_string( "#{pg_str}" )
    pg.set_categories_from_string( '')
    pg.logged_user_id = current_user.id
    pg.user_id = current_user.id
    pg.creator = current_user
    pg.save
    pg
  end
end
