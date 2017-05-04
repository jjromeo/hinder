$(document).ready(function() {
  var photoId = $('#image_container').data('image-id')
  $('#dislike').on('click', function(event) {
    dislikeVote(event);
  });

  $('#like').on('click', function(event) {
    likeVote(event);
  });

  function dislikeVote(event) {
    // grab photo id from image container
    event.preventDefault();
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
  }

  function likeVote(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: '/votes',
      data: {
        vote_type: 'like',
        photo_id: photoId
      },
      success: openChat,
      error: function(error) {
        console.log(error);
      }
    });
  }

  function openChat() {
    console.log('Implement chat features!');
  }

  function getNextPhoto() {
    $('#photo').hide();
    $.ajax({
      type: "GET",
      url: '/photos/for_voting',
      success: function(photo) {
        if(photo) {
          $('#image_container').data('image-id', photo.id)
          console.log(photo.image_url)
          $('#photo').attr('src', photo.image_url)
          $('#photo').fadeIn();
        } else {
          alert("No more photos to vote on! Try again later!");
        }
      }
    })
  }
})
