class Filters < SiteBuilder
  def build
    liquid_filter "thousands_separated" do |input, separator|
      input.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{separator}")
    end
  end
end
