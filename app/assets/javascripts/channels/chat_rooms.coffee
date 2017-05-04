jQuery(document).on 'turbolinks:load', ->
  setup_messages = ->
    if $('#messages').length > 0
      messages = $('#messages')
      console.log('getting things done')
      App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->

      disconnected: ->

      received: (data)->
        console.log('received data')
        console.log(data)
        messages.append data['message']

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

      #This new_message id comes from rails form_helper
      $('#new_message').submit (e) ->
        $this = $(this)
        textarea = $this.find('#message_content')
        if $.trim(textarea.val()).length > 1
          App.global_chat.send_message(textarea.val(), messages.data('chat-room-id'))
          console.log(e)
          textarea.val('')
          e.preventDefault()
          return false

  setup_messages();

# Messages won't exist until a user likes a photo
# This will wait until it is inserted into the DOM (inside chat_room) to setup
  $(document).bind 'DOMNodeInserted', (event) ->
    if event.target.id == 'chat_room'
      setup_messages();
