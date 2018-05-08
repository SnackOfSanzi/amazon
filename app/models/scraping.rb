class Scraping

  def self.product_urls
    agent = Mechanize.new
    links = []

    #while true
        current_page = agent.get("https://www.e-hon.ne.jp/bec/SE/List?dcode=05&ccode=06&scode=02&listcnt=30&Genre_id=050602")
        elements = current_page.search('.listColumn .title a')
        elements.each do |ele|
            links << ele.get_attribute('href')
        end
    #end
    links.each do |link|
        get_info(link)
    end
  end

  # def self.get_product(link)
  #    agent = Mechanize.new
  #    page = agent.get(link)
  #    name = page.at('#main .rightCol .itemTitle').inner_text if page.at('#main .rightCol .itemTitle')
  #    description = page.search('.commentDetail p').inner_text if page.search('.commentDetail p')
  #    price = page.search('.mainItemTable tbody tr')[3].inner_text.gsub(/[^\d]/, "").to_i

  #    product = Product.new(name: name, description: description, price: price)
  #    product.save
  #  end

  # def self.image_urls(link)
  #   agent = Mechanize.new
  #   page = agent.get(link)
  #   image_url = page.at('.mainItemImg img')[:src]

  #   booksimage = Bookimage.new(image_url: image_url)
  #   booksimage.save
  # end

  def self.get_info(link)
      agent = Mechanize.new
      page = agent.get(link)
      isbn = page.search('.codeSelect')[0].inner_text
      pubiilsher = page.search('.mainItemTable tbody tr td')[0].inner_text
      saledate = page.search('.mainItemTable tbody tr td')[1].inner_text

      info = Registrationinformation.new(isbn: isbn, pubiilsher: pubiilsher, saledate: saledate)
      info.save
  end

end

