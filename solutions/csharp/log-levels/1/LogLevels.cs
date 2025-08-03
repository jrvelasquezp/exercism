using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        return (logLine.Substring(logLine.IndexOf("]:")+3, logLine.Length - logLine.IndexOf("]:") - 3)).Trim();
    }

    public static string LogLevel(string logLine)
    {
        return (logLine.Substring(logLine.IndexOf("[")+1, logLine.IndexOf("]")-1)).ToLower().Trim();
    }

    public static string Reformat(string logLine)
    {
        return Message(logLine)+" ("+LogLevel(logLine)+")";
    }
}
