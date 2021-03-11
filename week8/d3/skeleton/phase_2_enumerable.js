


Array.prototype.myEach = function(callback) {
   
     for (let i = 0; i < this.length; i++) {
         callback(this[i]);
    } 
}

let func = function (i) {
    console.log(i)
}

let arr3 = [1, 2, 3];
console.log(arr3.myEach(func));

//-----------------------------------------------

Array.prototype.myMap = function (callback) {
    const res = [];

   // return res.push(callback(this.myEach(func)))

   this.myEach((ele) => {res.push(callback(ele))})

   return res;
}

let newarr = [5,4,3,2,1];

console.log(newarr.myMap(function (el) {
    return el * 2;
}));

//-----------------------------------------------

Array.prototype.myReduce = function(callback) {
    let acc = callback()
    this.myEach((ele) => {(callback(ele))}) 
    return acc
}

let newarr2 = [5, 4, 3, 2, 1];


console.log(newarr2.myReduce(function(acc, ele) {    
    acc = newarr2[0]

    return acc += ele
}))





console.log(newarr2.reduce(function(acc, ele){
   return ele + acc
}))





