task :scrape => :environment do

	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	require 'csv'

	@phones = []

	def seed_phones
		@phones.each {|phone| Phone.create(name: phone[0], price: phone[1], link: phone[2])}
	end

	def generate_csv
		CSV.open("_phones.csv", "w") do |csv|
			csv << ["Name", "Price (RM)", "Link"]
			@phones.each {|phone| csv << phone}
		end
	end

	def do_scrape(url)
		puts "Scraping page #{url.split('=').last} ===============".yellow
		listing = Nokogiri::HTML(open(url))
		lists   = listing.css('div.product-card')
		lists.each do |list|
			link  = list.css('a')[0]['href']
			title = list.css('span.product-card__name.big')[0].text
			price = list.css('div.product-card__price')[0].text.delete("RM ").delete(",").to_f
			@phones << [title, price, link]
		end
	end
	
	def go(url)
		do_scrape(url)
		current_page = Nokogiri::HTML(open(url))
		can_proceed?(get_next_url(current_page)) if has_next?(current_page)
		# generate_csv if has_next?(current_page).blank?
		seed_phones if has_next?(current_page).blank?
	end

	def has_next?(page)
		return true if page.css('a.next_link').present?
	end

	def get_next_url(page)
		page.css('a.next_link')[0]['href']
	end

	def can_proceed?(url)
		go(url) if url.present?
	end

	base_url = "http://www.lazada.com.my/shop-mobiles/?itemperpage=120&operating_system=Android&page=1"
	go(base_url)

end
