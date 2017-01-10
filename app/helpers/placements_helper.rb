module PlacementsHelper
  def countries
    Placement.pluck(:country).uniq.reject { |c| c.nil? || c.empty? }
  end

  def regions
    Placement.pluck(:region).uniq.reject { |c| c.nil? || c.empty? }
  end

  def localities
    Placement.pluck(:locality).uniq.reject { |c| c.nil? || c.empty? }
  end
end
