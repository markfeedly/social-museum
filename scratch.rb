default: &default
adapter: postgresql
encoding: unicode
# For details on connection pooling, see rails configuration guide
# http://guides.rubyonrails.org/configuring.html#database-pooling
pool: 5
host: localhost
username: postgres
password: 'subito_is_a_soccer_or_football_game;I_think'

production:
    <<: *default
   database: social-museum