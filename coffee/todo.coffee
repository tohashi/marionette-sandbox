app.module 'Todo', (Todo, app) ->
  Todo.ItemView = Marionette.ItemView.extend

    tagName: 'li'

    template: 'todoItemTemplate'

  Todo.Model = Backbone.Model.extend

    defaults:
      title: ''
      desc: ''
      completed: false
      createdAt: 0
      limit: 0

    initialize: ->
      if @isNew() then @set 'createdAt', Date.now()


  Todo.Collection = Backbone.Collection.extend

    model: Todo.Model

    localStorage: new Backbone.LocalStorage 'todoapp'

