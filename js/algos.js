//RELEASE 0
//Pseudocode
// -Store the array of strings in the variable wordAarray
// -Set the variable swap equal to false
// -Loop for a many times as the length of the array
//   -WHILE the variable not_sorted equals true
//     -Set the variable not_sorted equal to false
//     -Perform bubble sort on wordArray, comparing string lengths
//       -IF the string stored in the index of wordArray is less than that of the subsequent index
//         -switch their indexes
//         -Set not_sorted equal to true
// -Output the last index of wordArray

function longest(wordArray) {
  var not_sorted;

    do {
      not_sorted = false;
      for (var i = 0; i < wordArray.length - 1; i++) {
          if (wordArray[i].length > wordArray[i + 1].length) {
            var temp = wordArray[i];
            wordArray[i] = wordArray[i + 1];
            wordArray[i + 1] = temp;
            not_sorted = true;
          }
        }
    } while (not_sorted);

  console.log(wordArray[wordArray.length - 1]);

  return wordArray[wordArray.length - 1];
}
///////////////////////////////////////////////////
//RELEASE 1
//Pseudocode
// -Store the two objects in the variables object1 & object2
// -Set the variable matchFound equal to false
// -Set the variable matchCount equal to zero
//  -Iterate through object1
//    -Iterate through object2
//      -IF any of object2's keys or values matches the current object1 pair
//        -Add one to the matchCount
// -IF matchCount is greater than or equal to 1
//  -Set matchFound equal to true
//  -return the value of matchFound

function match(object1, object2){
  var matchFound = false, matchCount = 0;

  for (var i = 0; i < Object.keys(object1).length; i++) {
    for (var k = 0; k < Object.keys(object2).length; k++) {
      if (object1[ Object.keys(object1)[i] ] == object2[ Object.keys(object2)[k] ]) {
        matchCount += 1;
      }
    }
  }

  if (matchCount >= 1) { matchFound = true; }

  console.log(matchFound);

  return matchFound;
}
///////////////////////////////////////////////////
//RELEASE 2
//Pseudocode
// -Store an integer in the variable arraylength
// -Create an empty array called stringArray
//   -Loop as many times as arraylength
//     -Set a random integer between one and ten equal to the variable randStringLength
//     -Loop as many times as randStringLength
//       -Store a random letter in the variable string
//     -Store the variable string in stringArray

function randStringArray(arraylength) {
  var stringArray = [], randStringLength;

  for (i = 0; i < arraylength; i++) {
    string = '';
    randNumber = (Math.floor(Math.random() * 9 + 1))
    for (k = 0; k < randNumber; k++){
      var characters = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
      var randCharacter = Math.floor(Math.random() * characters.length);
      string += characters.substring(randCharacter,randCharacter + 1);
    }
    stringArray.push(string);
  }

  console.log(stringArray);

  stringArray;
}
///////////////////////////////////////////////////
//Drivercode
randStringArray(3);
randStringArray(10);

longest(["Robert", "Bjorn", "Garret", "Amelia", "Susan"]);
longest(["abcde", "abcd", "abc", "ab", "a"]);

console.log(match({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(match({name: "Sahara", age: 35}, {name: "Kendrick", age: 26}));
