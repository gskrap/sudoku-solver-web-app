$(document).ready(function() {
  $('.solved_cell').on('click', function(){
    this.style.color = 'gray';
  });

  $('#show-solution-btn').on('click', function(){
    var solved_cells = document.getElementsByClassName('solved_cell');
    var i;
    for (i = 0; i < solved_cells.length; i++) {
    solved_cells[i].style.color = 'gray';
    }
  });

  $('#hide-solution-btn').on('click', function(){
    var solved_cells = document.getElementsByClassName('solved_cell');
    var i;
    for (i = 0; i < solved_cells.length; i++) {
    solved_cells[i].style.color = 'transparent';
    }
  });

  $('#home-btn').click(function() {
  window.location='/';
  });
});
