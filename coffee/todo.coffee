App.module 'Todo', (Todo, App) ->

  Todo.ItemView = Marionette.ItemView.extend

    tagName: 'li'

    template: '#todoItemTemplate'

    modelEvents:
      'change': 'render'

  Todo.ListView = Marionette.CompositeView.extend

    template: '#todoListTemplate'

    itemView: Todo.ItemView

    itemViewContainer: '#todoList'

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

    localStorage: new Backbone.LocalStorage 'todoApp'

    comparator: (todo) ->
      todo.get 'createdAt'

