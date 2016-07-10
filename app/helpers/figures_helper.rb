module FiguresHelper
  def sortable(column)
    title = column.titleize
    link_to title, sorted_table_path(column: column, direction: 'desc'), remote: true
  end
end
