proc abbreviate {phrase} {
    set length [string length $phrase]
    set acro ""
    set phrase [string map { "_" " " "-" " " "'" ""} $phrase]
    for {set i 0} {$i < $length} {incr i} {
        set chars [string index $phrase $i]
        set ws [string wordstar $phrase $i]
        set is_upper [scan $chars {%[A-Za-z]} m]
        if { $is_upper == 1 
            && $i == $ws} {
            append acro [string toupper $chars]
        }
    }
    return $acro
}
