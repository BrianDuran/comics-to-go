class Metric

  def initialize values
     @values = values
  end

  def get_values
    "Values: #{@values.join("-")}"
  end

#Calculates the average value
  def average
    total = @values.reduce(:+)
    return "Average #{total/@values.size}"
  end


  def odds
    odds = @values.select{|num| num.odd?}
    "Odds: #{odds.join('-')}"
  end

  def addvalue value
    if (0..100).include? value
      @values << value
    end
  end


  def hash
    {
      first: @values.first,
      last: @values.last
    }
  end
end

m = Metric.new([10, 3, 5, 6, 8, 8])
puts m.get_values
m.addvalue 15
puts m.get_values
puts m.average
puts m.odds
puts m.hash
