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
