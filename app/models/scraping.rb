class Scraping
  def self.brand_names
    names = []
    agent = Mechanize.new
    current_page = agent.get("file:///Users/lomokiyo/Desktop/sample.html")
    elements = current_page.search('p')
    elements.each do |ele|
      names << ele.inner_text
    end

    names.each do |name|

    brand = Brand.where(name: name).first_or_initialize
    brand.save
    
    end
  end
end