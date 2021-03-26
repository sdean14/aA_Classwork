/*
Array.prototype.uniq = function(array) {
  let uniqValuesArray = [];
  array.for (let i = 0; i < array.length; i++) {
    if (!uniqValuesArray.includes(array[i])) {
     uniqValuesArray.push(array[i]); }; 
    };
    uniqValuesArray;
}
*/
// function Array(arr) {
//   this.arr = [1, 2, 2, 3, 3, 3]
// };

Array.prototype.uniq = function () {
  let uniqValuesArray = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniqValuesArray.includes(this[i])) {
     uniqValuesArray.push(this[i]); }; 
    };
    return uniqValuesArray;
  console.log(this)
  };

// console.log([1, 2, 2, 3, 3, 3].uniq())


Array.prototype.twoSum = function () {
  let sums = [];
  for (let i = 0; i < (this.length - 1); i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0 && i !== j) {
        sums.push([i, j]);
      };
    }
  }
  return sums;
};

// console.log([2, -2, 5, 1, -1].twoSum())

Array.prototype.transpose = function () {
  let transposed = new Array(this.length);
  for (let i = 0; i < this.length; i++){
    transposed[i] = new Array(this.length);
  }
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      transposed[i][j] = this[j][i];
    };
  }
  return transposed;
}

console.log(
  [[1, 2, 7],
   [3, 4, 4],
   [5, 7, 9]
  ].transpose())

  