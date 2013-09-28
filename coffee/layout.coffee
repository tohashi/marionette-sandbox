App.module 'Layout', (Layout, App) ->

  Layout.HeaderView = Marionette.ItemView.extend

    template: '#headerTemplate'

    ui:
      titleInput: '#titleInput'
      descInput: '#descInput'

    events:
      'click button[name="addTodo"]': 'addTodo'

    addTodo: (e) ->
      title = @ui.titleInput.val().trim()
      desc = @ui.descInput.val().trim()

      if title
        @collection.create
          title: title
          desc: desc
      @resetForm()

    resetForm: ->
      _.forEach @ui, (input) -> input.val ''

