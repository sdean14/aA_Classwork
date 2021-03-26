class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date =  new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hour = this.date.getHours();
    this.minute = this.date.getMinutes();
    this.second = this.date.getSeconds();
    // console.log(hour);
    // console.log(minute);
    // console.log(second);
    // 3. Call printTime.
    this.printTime(); //come back?
    // console.log(this.printTime());
    // 4. Schedule the tick at 1 second intervals.
    this._tick = this._tick.bind(this);
    setInterval(this._tick, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    const time = (`${this.hour}:${this.minute}:${this.second}`);
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.second += 1;
    // 2. Call printTime.
    this.printTime();
  }
}
  const readline = require('readline');

  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
      reader.question('Number?', function(res){
      let resNum = parseInt(res);
      sum += resNum;
      numsLeft -= 1;
      console.log(sum);
      });
      this.addNumbers(sum, numsLeft, completionCallback)
    }
    
    if (numsLeft === 0) {
      completionCallback(sum)
    }
  }






const clock = new Clock();
// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
