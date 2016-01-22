module ApplicationHelper

  def position_options
    Position.all.map{|x|[x.name,x.id]}
  end
end
