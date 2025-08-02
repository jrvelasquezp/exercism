module bob
  implicit none
contains

  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    hey = "Whatever."
    if (scan(statement, "abcdefghijklmnopqrstuvxyz")==0 .and. scan(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")>0 .and. &
    statement(len(statement):len(statement))=="?") then
      hey="Calm down, I know what I'm doing!"
    else if (scan(adjustr(statement), "?")>0 .and. statement(len(adjustr(statement)):len(adjustr(statement)))==" ") then
      hey="Sure."  
    else if (statement(len(adjustr(statement)):len(adjustr(statement)))=="?") then
      hey="Sure."
    else if (scan(statement, "abcdefghijklmnopqrstuvxyz")==0 .and. scan(statement, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")>0) then
      hey="Whoa, chill out!"
    else if (statement=="") then
      hey="Fine. Be that way!"
    end if 
  end function hey

end module bob
