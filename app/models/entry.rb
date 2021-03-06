class Entry < ActiveRecord::Base
  belongs_to :list

  def self.search(search)
    if search
      where('english LIKE ? OR japanese LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
