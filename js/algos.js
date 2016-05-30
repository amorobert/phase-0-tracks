// -Store the array of strings in the variable wordAarray
// -Set the variable swap equal to false
// -Loop for a many times as the length of the array
//   -WHILE the variable swap equals true
//     -IF the string stored in the first index of wordArray is less than the second index
//       -switch their indexes
//       -Set swap equal to true
//       -Check the two subsequent indexes using the same conditions
//     -ELSE the string stored in the first index of wordArray is more than the second index
//       -Set swap equal to false
function Longest(wordArray) {
  var not_sorted;

    do {
      not_sorted = false;
      for (i = 0; i < wordArray.length - 1; i++) {
          if (wordArray[i].length > wordArray[i + 1].length) {
            var temp = wordArray[i];
            wordArray[i] = wordArray[i + 1];
            wordArray[i + 1] = temp;
            not_sorted = true;
          }
        }
    } while (not_sorted);
  console.log(wordArray[wordArray.length - 1]);
}

Longest(["Robert", "Bjorn", "Garret", "Amelia", "Susan"]);
Longest(["abcde", "abcd", "abc", "ab", "a"]);
