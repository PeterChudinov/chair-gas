class Gas < ApplicationRecord

  validates_uniqueness_of :state

  def self.update_price!
    Gas.all.each do |g|
      if g[:updated_at] < 1.day.ago
        Rails.cache.fetch("#{g.state}/price", expires_in: 24.hours) do
          page = Nokogiri::HTML(open("http://gasprices.aaa.com/?state=#{g.state}"))
          prices = page.xpath('//table/tbody/tr/td')
          update(price: prices[1].text.tr('$', '').to_f)
        end
      end
    end
  end
end
