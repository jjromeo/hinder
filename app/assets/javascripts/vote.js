$(document).ready(function() {
  // grab photo id from image container
  $('#dislike').on('click', function(event) {
    dislikeVote(event);
  });

  $('#like').on('click', function(event) {
    likeVote(event);
  });

  function dislikeVote(event) {
    var photoId = $('#image_container').data('image-id');
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
    var photoId = $('#image_container').data('image-id');
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
    var photoId = $('#image_container').data('image-id');
    $.ajax({
      type: "POST",
      url: '/chat_rooms',
      data: {
        photo_id: photoId
      },
      success: function(data) {
        $('#chat_room_container').html(data.chat_room_html);
      }
    });
  }

  function getNextPhoto() {
    $('#photo').hide();
    $.ajax({
      type: "GET",
      url: '/photos/for_voting',
      success: function(photo) {
        if(photo) {
          $('#image_container').data('image-id', photo.id)
          $('#photo').attr('src', photo.image_url)
          $('#photo').fadeIn();
        } else {
          alert("No more photos to vote on! Try again later!");
        }
      }
    })
  }
})
