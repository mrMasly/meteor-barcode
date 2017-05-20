import './common.coffee'
import debounce from 'lodash.debounce'

chars = []

$(document).on 'keypress', (e) ->

  keycode = if e.which then e.which else e.keyCode

  if keycode >= 65 and keycode <= 90 or keycode >= 97 and keycode <= 122 or keycode >= 48 and keycode <= 57
    chars.push String.fromCharCode keycode
  else if keycode is 13
    if chars.length >= 10
      Barcode.trigger chars.join('')
    chars = []
  do update

update = debounce ->
  chars = []
, 50
