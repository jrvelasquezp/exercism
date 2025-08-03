
module space_age
  implicit none
contains

  double precision function age_in_years(planet, seconds)
    character(len=*), intent(in) :: planet
    double precision, intent(in) :: seconds
    
    age_in_years = 0.d0

    if (planet=='Earth') then
      age_in_years=seconds/31557600
    else if (planet=='Mercury') then
      age_in_years=seconds/(31557600.d0*0.2408467d0)
    else if (planet=='Venus') then
      age_in_years=seconds/(31557600.d0*0.61519726d0)
    else if (planet=='Mars') then
      age_in_years=seconds/(31557600.d0*1.8808158d0)
    else if (planet=='Jupiter') then
      age_in_years=seconds/(31557600.d0*11.862615d0)
    else if (planet=='Saturn') then
      age_in_years=seconds/(31557600.d0*29.447498d0)
    else if (planet=='Uranus') then
      age_in_years=seconds/(31557600.d0*84.016846d0)
    else if (planet=='Neptune') then
      age_in_years=seconds/(31557600.d0*164.79132d0)
    end if
    
  end function

end module
