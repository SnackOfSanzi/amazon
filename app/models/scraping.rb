class Scraping

  def self.product_urls
    agent = Mechanize.new
    links = []

    #while true
        current_page = agent.get("https://www.e-hon.ne.jp/bec/SE/List?dcode=05&ccode=06&scode=02&listcnt=0&Genre_id=050602")
        elements = current_page.search('.listColumn .title a')
        elements.each do |ele|
            links << ele.get_attribute('href')
        end
    #end
    links.each do |link|
        get_product(link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at('#main .rightCol .itemTitle').inner_text if page.at('#main .rightCol .itemTitle')
    description = page.search('.commentDetail p').inner_text if page.search('.commentDetail p')
    price = page.search('.mainItemTable tbody tr')[3].inner_text.gsub(/[^\d]/, "").to_i

    product = Product.new(name: name, description: description, price: price)
    product.save
  end
end

