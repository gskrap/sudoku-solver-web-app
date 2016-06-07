$(document).ready(function() {
  $('.solved_cell').on('click', function(){
    this.style.color = 'gray';
  });

  $('#solution-btn').on('click', function(){
    var solved_cells = document.getElementsByClassName('solved_cell');
    var i;
    for (i = 0; i < solved_cells.length; i++) {
    solved_cells[i].style.color = 'gray';
    }
  });

  $('#home-btn').click(function() {
  window.location='/';
  });
});
