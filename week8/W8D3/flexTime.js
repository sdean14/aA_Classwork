Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i])
  }
};

const callback = function(el) {
  console.log(el)
};

Array.myEach(callback);

Array.prototype.myMap = function(callback) {
  let result = [];

  const func = function(el) {
    result.push(callback(el))
  }
  this.myEach(func)

};