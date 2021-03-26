// Array.prototype.myEach = function () {

//   this.forEach(el => callback(el));
//   return this
// }

// console.log([1, 2, 3, 4].myEach());

// Array.prototype.myMap = function () {
//   let mapped = [];

//   for (let i = 0; i < this.length; i++) {
//     mapped.push(callback(this[i]));
//   };
//   return mapped;
// };

function callback(el) {
  return el * 2
};

Array.prototype.myReduce = function () {
  let accumulator = this[0];
  if (this.length < 2 ) {
    return accumulator;
  };

  for (let i = 1; i < this.length; i++) {
    accumulator =  accumulator + callback(i);
  };
  return accumulator;
};

console.log([1, 2, 3, 4].myReduce());