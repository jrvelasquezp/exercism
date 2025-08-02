class Raindrops

  def self.convert(number)
    s=''
    if not(number%3==0 or number%5==0 or number%7==0)
      s="#{number}"
    else
      if number%3==0
        s=s+'Pling'
      end
      if number%5==0
        s=s+'Plang'
      end
      if number%7==0
        s=s+'Plong'
      end
    end
  return s
  end

end