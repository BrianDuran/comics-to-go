class Metric

  def initialize values
     @values = values
  end

  def get_values
    "Values: " + @values.join("-"); # "Values: #{ @values.join("-")}"
  end

#Calculates the average value
  def average
    total = 0
    metricsValues = @values
    metricsValues.each { |metric|
      total = total+metric
    }
    average = total / metricsValues.size
    return "Average: "+average.to_s
=begin
  total = @values.reduce(:+)
  return "Average #{total/@values.size}"
=end

  end


  def odds
    odds = @values.select do |value|
      if value % 2 == 0
        false
      else
        true
       end
    end
    "Odds: " + odds.join('-')
  end

  def addvalue (value) #def addvalue value ?
    if value > 0 and value < 100
      @values << value
    end
  end


  def hash
    { "first" => @values[0],
      "last" => @values[@values.size - 1]
    }
=begin
  { first: @values[0],
    last: @values[@values.size - 1] }
=end
  end
end

m = Metric.new([10, 3, 5, 6, 8, 8])
puts m.get_values
m.addvalue 15
puts m.get_values
puts m.average
puts m.odds
puts m.hash
