## Malaysia Android Phones Price List

This Rails app pull data from Lazada Malaysia to get phones name, price and link and save to database.

To save to a CSV file, uncomment `generate_csv if has_next?(current_page).blank?` inside scrape.rake file and run `rake scrape` from terminal.

[See app on Heroku](#)

### Clone instructions

1. Clone this project
2. `bundle install`
3. `rake db:create db:migrate db:seed` (might take a while to finish)
4. `rails s`
5. Done
