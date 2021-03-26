const View = require('./ttt-view.js')
const Game = require('./game.js');



window.View = View;
window.Game = Game;

  $(() => {
    const $ttt = $('.ttt')
    const game = new Game();
    new View(game, $ttt);
  });

  
  // const view = new View()
  // view.setupBoard()
  