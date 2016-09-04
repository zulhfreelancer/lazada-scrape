## Malaysia Android Phones Price List

This Rails app pull data from Lazada Malaysia to get phones name, price and link and save to database.

[See app on Heroku](https://lazada-scrape.herokuapp.com/)

### Clone instructions

1. Clone this project
2. `bundle install`
3. `rake db:create db:migrate db:seed` (might take a while to finish)
4. `rails s`
5. Done

### Scrape instructions

To save to a CSV file, uncomment `generate_csv if has_next?(current_page).blank?` inside scrape.rake file and run `rake scrape` from terminal.

By default, all phones data will save to database.

Make sure your database is clean before run `rake scrape` command. Otherwise, run `rake db:drop db:create db:migrate` before running that scrape command.
