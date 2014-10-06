$(document).ready(function() {
  $('.delete').on('click', function(evt){
    if (!confirm("Are you sure!?")){
      evt.preventDefault();
    }
  })
});
