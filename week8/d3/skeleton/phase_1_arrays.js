/* function uniqueArray(arr) {

} */

Array.prototype.uniq = function() {
  let res = [];

  for(let i = 0; i<this.length; i++) {  //[1,2,2,3]  i === undefined
    if(!res.includes(this[i])) {
        res.push(this[i]);
    }
  }

  return res
}

let arr = [1, 2, 2, 3, 3, 3];
console.log(arr.uniq())

Array.prototype.twoSum = function() {
    let arr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j= 0; j < this.length; j++) {
            if (this[i] + this[j] === 0 && j > i ) {
                arr.push(this[i], this[j]);
            }
        }
    }
    if (arr[0] + arr[1] === 0) {
        return true;
    }
} 
 let arr2 = [4, -4, 10];
 console.log(arr2.twoSum());