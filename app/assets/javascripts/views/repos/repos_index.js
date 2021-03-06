GitOrganized.Views.ReposIndex = Backbone.View.extend({
  tagName: 'option',
  template: JST['repos/index'],
  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
  },
  render: function() {
    this.$el.html( this.template( {repo: this.model.attributes} ));
    return this;
  },
});

GitOrganized.Views.ReposListIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
  },
  tagName: 'select',
  render: function() {
    var that = this;
    this.$el.empty()
    this.$el.append($("<option>").html("Select a repo"));
    _.each(this.collection.models, function(repo) {
      var repoView = new GitOrganized.Views.ReposIndex({model: repo});
      that.$el.append(repoView.render().el);
    });
    return this;
  },
  events: {
    'change': function() {
      this.getTodos();
      this.getCommits();
    }
  },
  getTodos: function(){
    $(".todo-items").hide();
    $(".creator").hide();
    $(".todos").hide();
    $(".todo-creation").hide();
    $(".todo-items").fadeIn(1250);
    $(".todos").fadeIn(1250);
    $(".todo-creation").fadeIn(1250);
    $(".todo-creation").html($("<form>").addClass("todo-form form-horizontal"))
    $(".todo-form").html($("<input>").addClass("todo-input form-control").attr("placeholder", "New todo"))
    var repoId = parseInt($('select').children(':selected')[0].children[0].value)
    var todoItems = new GitOrganized.Collections.TodoItems();
    var todoItemsListIndex = new GitOrganized.Views.TodoItemsListIndex({
      collection: todoItems
    });
    var todoItemBody = $('.todo-items');
    todoItemBody.html( todoItemsListIndex.render().el )
    todoItems.fetch({
      url: '/repos/'+String(repoId)+'/todo_items',
      success: function(data) {
      }
    });
    $('.todo-form').on('submit', function(e) {
      e.preventDefault();
      e.stopImmediatePropagation();
      var text = $('.todo-input').val();
      var repoId = parseInt($('select').children(':selected')[0].children[0].value)
      if (text) {
        todoItems.create({
        content: text,
        repo_id: repoId
        })
      }
      $('.todo-form')[0].reset();
    })
  },
  getCommits: function() {
    $(".commits").hide();
    $('.commits, .commit-header').fadeIn(950);
    var repoId = parseInt($('select').children(':selected')[0].children[0].value)
    var commits = new GitOrganized.Collections.Commits();
    var commitListIndex = new GitOrganized.Views.CommitsListIndex({
      collection: commits
    });
    var commitBody = $('.commits');
    commitBody.html( commitListIndex.render().el )
    commits.fetch({
      url: '/repos/'+String(repoId)+'/commits',
      success: function(data) {
      }
    });
  }
});
