//Paired with Bjorn John Ramos
//Release 1
horseName = ["Yeezy", "Amy", "Mary", "Kali"]
horseColor = ["blue", "red", "orange", "yellow" ]

function newHorses(name, color) {
  horseObject = {};

  for(var i = 0; i < horseName.length; i++) {
    horseObject[horseName[i]] = horseColor[i];
  }

  for(i = 0; i < horseName.length; i++) {
    console.log("Name: " + Object.keys(horseObject)[i] + "  Color: " + horseObject[Object.keys(horseObject)[i]]);
  }
}
newHorses(horseName, horseColor)

//Release 2
function Car(year, make, model) {
  this.year = year;
  this.make = make;
  this.model = model;

  this.engineRev = function() { console.log("Vrooom!!!");};

  console.log("CAR INITIALIZATION COMPLETE.");
};

newCar = new Car(2017, "Tesla", "Model X");

console.log("Year: "+ newCar.year);
console.log("Make:" + newCar.make);
console.log("Model:" + newCar.model);
newCar.engineRev()
//Note that Teslas, being electric, don't actually make a "Vroom" sound...
