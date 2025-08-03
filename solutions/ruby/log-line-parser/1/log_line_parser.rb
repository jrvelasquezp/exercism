class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    debug "Index=#{1+@line.index(':')}"
    return "#{@line[2+@line.index(':'),@line.size-@line.index(':')].strip}"
  end

  def log_level
    return "#{@line[1+@line.index('['),-1+@line.index(']')].downcase}"
  end

  def reformat
    return "#{message} (#{log_level})"
  end
end
