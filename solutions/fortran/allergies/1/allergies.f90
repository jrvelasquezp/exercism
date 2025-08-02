
module allergies
  implicit none

contains

  logical function allergicTo(allergy_str, allergy_key)
    character(len=*), intent(in) :: allergy_str
    integer, intent(in) :: allergy_key
    integer :: str_value, divider
    allergicTo = .false. 
    if (allergy_key==0) then
      allergicTo = .false. 
    else if (allergy_key==255) then
      allergicTo = .true.
    else
      select case (allergy_str)
        case ("eggs")
          allergicTo = btest(allergy_key,0)
        case ("peanuts")
          allergicTo = btest(allergy_key,1)
        case ("shellfish")
          allergicTo = btest(allergy_key,2)
        case ("strawberries")
          allergicTo = btest(allergy_key,3)
        case ("tomatoes")
          allergicTo = btest(allergy_key,4)
        case ("chocolate")
          allergicTo = btest(allergy_key,5)
        case ("pollen")
          allergicTo = btest(allergy_key,6)
        case ("cats")
          allergicTo = btest(allergy_key,7)
      end select
    end if
  end function


  function allergicList(allergy_key)
    integer, intent(in) :: allergy_key
    character(len=100) :: allergicList
    allergicList = ' '
    if (btest(allergy_key,0)) then
        allergicList=trim(allergicList) // 'eggs '
    end if
    if (btest(allergy_key,1)) then
        allergicList=trim(allergicList) // ' peanuts '
    end if
    if (btest(allergy_key,2)) then
        allergicList=trim(allergicList) // ' shellfish '
    end if
    if (btest(allergy_key,3)) then
        allergicList=trim(allergicList) // ' strawberries '
    end if
    if (btest(allergy_key,4)) then
        allergicList=trim(allergicList) // ' tomatoes '
    end if
    if (btest(allergy_key,5)) then
        allergicList=trim(allergicList) // ' chocolate '
    end if
    if (btest(allergy_key,6)) then
        allergicList=trim(allergicList) // ' pollen '
    end if
    if (btest(allergy_key,6)) then
        allergicList=trim(allergicList) // ' cats '
    end if
    allergicList=adjustl(allergicList)
  end function



end module
