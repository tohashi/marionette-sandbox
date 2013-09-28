window.App = new Backbone.Marionette.Application()

$ -> App.start()

App.addRegions
  header: 'header'
  mainContents: '#mainContents'

App.module 'TodoList', (TodoList, App) ->

  class TodoList.Controller

    constructor: ->
      @todos = new App.Todo.Collection()
      @showLayouts()
      @showTodos()

    showLayouts: ->
      App.header.show new App.Layout.HeaderView collection: @todos

    showTodos: ->
      App.mainContents.show new App.Todo.ListView collection: @todos

  TodoList.addInitializer ->
    controller = new TodoList.Controller()

