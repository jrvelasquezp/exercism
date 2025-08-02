class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed < 5
      return @speed * 221
    elsif @speed < 9
      return @speed * 221 * 0.9
    elsif @speed < 10
      return @speed * 221 * 0.8
    else
      return @speed * 221 * 0.77
    end
  end

  def working_items_per_minute
    return (production_rate_per_hour / 60).to_i
  end
end
