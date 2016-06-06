module PagesHelper
  
  def get_initalised_page(pg_str)
    pg = Page.new
    pg.description = File.read(Rails.root.join("config/initial_pages/#{pg_str}.md"))
    pg.title = Title.create(title: "SPECIAL: #{pg_str.capitalize}")
    pg.set_tags_from_string( "#{pg_str}" )
    pg.set_categories_from_string( '')
    pg.logged_user_id = 1
    pg.user_id = pg.logged_user_id
    pg.save
    pg
  end
end
