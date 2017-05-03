$(document).ready(function() {
  $('#dislike').on('click', function(e) {
    // grab photo id from image container
    var photoId = $('#image_container').data('image-id')
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: '/votes',
      data: {
       vote_type: 'dislike',
       photo_id: 15 
      },
      success: function() {
      },
      error: function(error) {
        console.log(error);
      }
    });
  });

  function getNextPhoto() {
    
  }
})
