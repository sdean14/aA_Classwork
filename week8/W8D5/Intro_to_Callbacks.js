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
    this.seconds()
    // 2. Call printTime.
    this.printTime();
  }

  seconds() {
    if (this.second < 59) {
      this.second += 1;
    } else {
      this.second = 0;
      this.minutes()
    }
    return this.second;
  }

  minutes() {
    if (this.minute < 59) {
      this.minute += 1;
    } else {
      this.minute = 0;
      this.hour()
    }
    return this.minute
  }

  hours() {
    if (this.hour < 24) {
      this.hour += 1;
    } else {
      this.hour = 1;
    }
    return this.hour
  }


}

  const readline = require('readline');
  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  // function addNumbers(sum, numsLeft, completionCallback) {
  //   if (numsLeft > 0) {
  //     reader.question('Number?', function(res){
  //     let resNum = parseInt(res);
  //     sum += resNum;
  //     numsLeft -= 1;
  //     console.log(sum);
  //     addNumbers(sum, numsLeft, completionCallback)
  //     });
  //   }
  //   if (numsLeft === 0) {
  //     completionCallback(sum)
  //     reader.close();
  //   }
  // }

  // addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

  function absurdBubbleSort(arr, sortCompletionCallback) {

  }

  function askIfGreaterThan(el1, el2, callback) {
    reader.question('Is num1 greater than num2?', function(res){ 
      if (res === 'yes') {
        callback(true);
      } else {
        callback(false);
      }
    });
  }
  function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length -1) {
      askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) =>{})
    }
  }

  askIfGreaterThan(2, 5, function callback() {
    console.log();
  })
