#if !defined(SPACE_AGE_H)
#define SPACE_AGE_H

const double one_year_in_earth=31557600;
const double year_in_mercury=0.2408467;
const double year_in_venus=0.61519726;
const double year_in_mars=1.8808158;
const double year_in_jupiter=11.862615;
const double year_in_saturn=29.447498;
const double year_in_uranus=84.016846;
const double year_in_neptune=164.79132;

namespace space_age {
    class space_age{
        public:
            space_age(double a);
            double seconds() const{ return age_in_seconds; }
            double on_earth() const{ return age_in_seconds/one_year_in_earth; }
            double on_mercury() const{ return on_earth()/year_in_mercury; }
            double on_venus() const{ return on_earth()/year_in_venus; }
            double on_mars() const{ return on_earth()/year_in_mars; }
            double on_jupiter() const{ return on_earth()/year_in_jupiter; }
            double on_saturn() const{ return on_earth()/year_in_saturn; }
            double on_uranus() const{ return on_earth()/year_in_uranus; }
            double on_neptune() const{ return on_earth()/year_in_neptune; }
        private:
            double age_in_seconds;
    };
}  // namespace space_age

#endif // SPACE_AGE_H
