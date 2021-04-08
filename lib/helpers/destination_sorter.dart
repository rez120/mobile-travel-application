destinationSorter(var destinations) {
  for (var i = 0; i < destinations.length; i++) {
    switch (destinations[i].continent) {
      case "AFRICA":
        africanDestinations.add(destinations[i]);
        break;
      case "EUROPE":
        europeanDestinations.add(destinations[i]);
        break;
      case "NORTH AMERICA":
        northAmericanDestinations.add(destinations[i]);
        break;
      case "SOUTH AMERICA":
        southAmericanDestinations.add(destinations[i]);
        break;
      case "OCEANA":
        oceanianDestinations.add(destinations[i]);
        break;
      case "ASIA":
        asianDestinations.add(destinations[i]);
        break;
      case "ANTARCTICA":
        antarcticanDestinations.add(destinations[i]);
        break;
      default:
        break;
    }
  }
}

var africanDestinations = [];
var europeanDestinations = [];
var northAmericanDestinations = [];
var southAmericanDestinations = [];
var asianDestinations = [];
var oceanianDestinations = [];
var antarcticanDestinations = [];
