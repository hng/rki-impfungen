class ImpfquotenData < SiteBuilder
    def build
    generator do
      site.data.impfquoten_latest =  site.data.impfquoten[site.data.impfquoten.keys.last]
      site.data.impfquoten_latest_date = site.data.impfquoten.keys.last
    end
  end
end
