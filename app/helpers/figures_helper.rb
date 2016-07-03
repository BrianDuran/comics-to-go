module FiguresHelper
  def sortable(column)
    title = column.titleize
    column = 'character' ? 'name' : column
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction
  end
end
