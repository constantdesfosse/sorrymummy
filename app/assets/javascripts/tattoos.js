$(document).ready(function() {
  $('.showhours').click(function() {
     $('(".tattoos-card-infos').slideToggle({ direction: "up" }, 300);
     $(this).toggleClass('clientsClose');
  }); // end click
});
