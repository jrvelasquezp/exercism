// Package leap implements a function that evaluates if
// a given year is leap or not.
package leap

func IsLeapYear(year int) bool {
	return (year%4==0 && (year%400==0 || year%100!=0))
}
