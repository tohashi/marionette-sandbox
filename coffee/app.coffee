window.App = new Backbone.Marionette.Application()

$ -> App.start()

App.addRegions
  mainContents: '#mainContents'

App.module 'TodoList', (TodoList, App) ->

  class TodoList.Controller

    constructor: ->
      @todos = new App.Todo.Collection()
      @showTodos()

    showTodos: ->
      App.mainContents.show new App.Todo.ListView collection: @todos

  TodoList.addInitializer ->
    controller = new TodoList.Controller()

