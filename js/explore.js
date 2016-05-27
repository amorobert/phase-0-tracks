// -Store the user input string in the variable inputString
// -Create a loop that stops once its looped as many times as the length of the inputString
//  -Access each leter of inputString using its index
//  -Output the last letter of the string, outputting the preceding letter thereafter


function reverse(inputString) {
  var outputString = '';

  for (var i = inputString.length - 1; i >= 0; i--) {
    outputString += inputString[i];
  }

  return outputString;
}

reverse("hello");
