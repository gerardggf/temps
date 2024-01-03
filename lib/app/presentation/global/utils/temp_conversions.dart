double farenheitToCelsius(double temp) => (temp - 32) / 1.8;

double kelvinToCelsius(double temp) => temp - 273.15;

double kelvinToFahrenheit(double temp) {
  double celsius = temp - 273.15;
  return (celsius * 9 / 5) + 32;
}
