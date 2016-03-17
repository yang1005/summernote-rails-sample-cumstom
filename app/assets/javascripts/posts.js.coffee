# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  sendFile = (file, editor, welEditable) ->
    data = new FormData
    data.append 'upload[image]', file
    $.ajax
      data: data
      type: 'POST'
      url: '/uploads'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        editor.insertImage welEditable, data.url

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#post_content')

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:500
    lang: 'ja-JP'
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"
    onImageUpload: (files, editor, welEditable) ->
      sendFile files[0], editor, welEditable

  # to set code for summernote
  # summer_note.summernote('code', summer_note.val()) # summernote0.7.0
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # summer_note.summernote('code', summer_note.val()); # summernote0.7.0
    # alert $('#post_content').code()
    summer_note.val summer_note.code()
    true