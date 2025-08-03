// Package weather provides tools to forecast the weather
//from a given city and current weather condition.
package weather

//CurrentCondition represents the weather condition.
var CurrentCondition string
//CurrentLocation represents the name of the city.
var CurrentLocation string

//Forecast returns a string made from the current location, some additional text and the 
//current weather condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
