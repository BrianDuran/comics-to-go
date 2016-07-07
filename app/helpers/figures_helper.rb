module FiguresHelper
  def sortable(column)
    title = column.titleize
    direction = column == params[:column] && params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, sorted_table_path(column: column, direction: direction), remote: true
  end
end
