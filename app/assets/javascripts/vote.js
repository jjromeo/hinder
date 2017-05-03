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
       photo_id: photoId
      },
      success: getNextPhoto,
      error: function(error) {
        console.log(error);
      }
    });
  });

  function getNextPhoto() {
    $.ajax({
      type: "GET",
      url: '/photos/for_voting',
      success: function(photo) {
        if(photo) {
          $('#photo').fadeOut();
          $('#image_container').data('image-id', photo.id)
          console.log(photo.image_url)
          $('#photo').attr('src', photo.image_url)
          $('#photo').fadeIn();
        } else {
          alert("No more photos to vote on! Try again later!")
        }
      }
    })
  }
})
