module EventsHelper
  def categories_collection
    Category.all.map {|c| ["#{c.title} #{Event.where(category_id: c.id).count}", c.id]}
  end
end
