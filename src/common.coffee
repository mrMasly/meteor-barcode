global = Function('return this')()

Barcode =
  _names: {}
  _callbacks: {}
  on: (type, cb) ->
    @_callbacks[type] ?= []
    @_callbacks[type].push cb
  off: (type, cb) ->
    @_callbacks[type] ?= []
    index = @_callbacks[type].indexOf(cb)
    @_callbacks[type].splice(index, 1)
  set: (name, collection, field='barcode') ->
    @_names[name] =
      collection: collection
      field: field
  trigger: (code) ->
    Meteor.call '__barcode__', code, (err, res) =>
      if err
        console.error err
      else
        if @_callbacks[res.type]?
          cbs = @_callbacks[res.type]
          if cbs.length
            cb = cbs[cbs.length-1]
            cb res.doc

global.Barcode = Barcode
