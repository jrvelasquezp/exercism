module LogLevels

let message (logLine: string): string =
    (logLine.Trim().Remove(0,3+logLine.Trim().IndexOf("]:"))).Trim()
let logLevel(logLine: string): string = 
    logLine.Remove(logLine.IndexOf("]:")).Remove(0,1).ToLower()
let reformat(logLine: string): string = 
    message(logLine)+" ("+logLevel(logLine)+")"