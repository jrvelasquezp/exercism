public class LogLevels {
    
    public static String message(String logLine) {
        String[] msg=logLine.split(":");
        return msg[1].trim();
    }

    public static String logLevel(String logLine) {
        String[] msg=logLine.split(":");
        return msg[0].substring(1,msg[0].length()-1).toLowerCase();
    }

    public static String reformat(String logLine) {
        return message(logLine).concat(" (".concat(logLevel(logLine).concat(")")));
    }
}
