GitOrganized.Views.TodoItemsIndex = Backbone.View.extend({

  tagName: 'li',
  className: 'to-do',
  template: JST['todo_items/index'],
  editTodoTemplate: JST['todo_items/edit'],
  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
  },
  render: function() {
    this.$el.html( this.template( this.model.attributes ));
    return this;
  },
  events: {
    'click [data-action="destroy"]': 'destroyItem',
    'click [data-action="edit"]': 'renderEditForm'
  },
  destroyItem: function(e) {
    e.preventDefault();
    this.model.destroy();
  },
  renderEditForm: function(e) {
    if (e.target.type === 'text') {
      return this;
    }
    var that = this;
    this.$el.html(this.editTodoTemplate( this.model.attributes ));
    this.$el.find('form').on('submit', function(e) {
      e.preventDefault();
      var textField = that.$el.find('input');
      newText = textField.val();
      textField.val('');
      that.model.set('content', newText);
      that.model.save();
    })
    return this;
  }
});

GitOrganized.Views.TodoItemsListIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
  },
  tagName: 'ul',
  id: 'todos-ul',
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(todoItem) {
      var todoView = new GitOrganized.Views.TodoItemsIndex({model: todoItem});
      that.$el.prepend(todoView.render().el)
    });
    return this;
  },
  events: {
    'click': 'reRender'
  },
  reRender: function(e) {
    if (e.target.className === 'to-do' || e.target.className === 'todos') {
      this.render();
    }
  }
});
