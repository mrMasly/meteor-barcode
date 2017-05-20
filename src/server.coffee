import './common.coffee'
import Fiber from 'fibers'

Fiber ->

  Meteor.methods
    __barcode__: (code) ->
      if DATA[code]?
        { collection, id, type } = DATA[code]
        doc = collection.findOne id
        unless doc?
          throw new Meteor.Error('404', "doc for barcode #{code} not found");
        return { doc, type }
      else
        throw new Meteor.Error('404', "barcode #{code} not found");

  DATA = {}

  Meteor.startup ->
    for name, data of Barcode._names

      docs = data.collection.find barcode: $ne: null, $exists: yes,
        fields: barcode: 1
      .fetch()
      for doc in docs
        if doc.barcode?
          DATA[doc.barcode] =
            id: doc._id
            collection: data.collection
            type: name

.run()
