defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      legacy? ->
        cond do
          level==1 -> :debug
          level==2 -> :info
          level==3 -> :warning
          level==4 -> :error
          true -> :unknown
        end
      not legacy? ->
        cond do
          level==0 -> :trace
          level==1 -> :debug
          level==2 -> :info
          level==3 -> :warning
          level==4 -> :error
          level==5 -> :fatal
          true -> :unknown
        end
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      level == 4 or (level == 5 and not legacy?) -> :ops
      (level < 1 or level > 4) and legacy? -> :dev1
      (level < 0 or level > 5) and not legacy? -> :dev2
      true -> false
    end
  end
end
