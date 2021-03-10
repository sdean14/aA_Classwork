Array.prototype.myEach = function(banana) {
    // let callback = function() {
    //     console.log(this[i])
    // }

    for (let i = 0; i < this.length; i++) {
         banana(this[i], i, this);
    }
}

let arr3 = [1, 2, 3];
console.log(arr3.myEach(function(s, i, arr3){ 
    console.log(s, i, arr3);
}));