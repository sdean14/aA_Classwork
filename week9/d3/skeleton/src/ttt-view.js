

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();  
  }

  bindEvents() {
    this.$el.on('click', (e)=>{
    const $clicked = $(e.target);
    const pos = $clicked.data('pos');
    
    $clicked.addClass('selected')
    // this.game.playMove(pos)
    this.makeMove($clicked);
    })
  }

  makeMove($square) {
    const currentPlayer = this.game.currentPlayer;
    const pos = $square.data('pos');
    // alert(`${e.msg()}`);
    $square.addClass(currentPlayer);
    try {
      this.game.playMove(pos);
    } catch (e) {
      alert(e.msg);
    }
    // this.game.playMove(pos);
    // if(!this.game.board.isEmpty(pos)){
    // }catch(e){
    //   alert(e.msg); 
    // } 

    if (this.game.isOver()){
      this.$el.addClass("game-over");
      this.$el.off('click')
    }
  
    const winner = this.game.winner();
    const $figCaption = $('<figcaption></figcaption>')
    if (winner) {
      this.$el.addClass(`winner-${winner}`);
      $figCaption.html(`YOU WIN! ${winner}`)
    }

    this.$el.append($figCaption);

  }


  setupBoard() {
    // const $el = $('<ul class="grid"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>')
    const $ul = $("<ul></ul>");
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li></li>");
        $li.data("pos", [rowIdx, colIdx]);
        $ul.append($li);
      }
    }
    this.$el.append($ul) 
    // const $ttt = $('.ttt')
    // $ttt.append($el);
  }
}

module.exports = View;
