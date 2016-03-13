class Search < ActiveRecord::Base

  def search_caps
    caps = Cap.all
    caps = caps.where(["title LIKE ?","%#{keywords}%"]) if keywords.present?
    caps = caps.where(["tag_list LIKE ?", category]) if category.present?
    caps = caps.where(["city LIKE ?", city]) if city.present?
    caps = caps.where(["state LIKE ?", state ]) if state.present?

    return caps
  end

end
