module Slugifiable
  def to_slug
    self.name.gsub(' ', '-').gsub(/[']/, '').downcase
  end
end