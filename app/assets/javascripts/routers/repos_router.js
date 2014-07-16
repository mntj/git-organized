GitOrganized.Routers.Repos = Backbone.Router.extend({
  routes: {
    "":"index",
    "repos/:repo_id/todo_items":"show"
  },
  initialize: function(options) {
    this.repos = new GitOrganized.Collections.Repos();
    // this.todoItems = new GitOrganized.Collections.TodoItems();
    //this.commits = new GitOrganized.Collections.Commits();
    var that = this;

    this.reposListIndex = new GitOrganized.Views.ReposListIndex({
      collection: this.repos
    });

    // this.todoItemsListIndex = new GitOrganized.Views.TodoItemsListIndex({
    //   collection: this.todoItems
    // });
    // this.commitsListIndex = new GitOrganized.Views.CommitsListIndex({
    //   collection: this.commits
    // });

    this.repos.fetch({async: false});
    // this.todoItems.fetch({async: false});
    //this.commits.fetch({async: false});

    this.views = {
      repolistIndex: this.reposListIndex
      // todoItemlistIndex: this.todoItemsListIndex
      //commitlistIndex: this.commitsListIndex
    };

    this.repoBody = $('.repos');
    //this.todoItemBody = $('.todo-items');
    //this.commitBody = $('commits');
    return this;
  },
  index: function() {
    this.repoBody.html( this.views.repolistIndex.render().el )
    // this.todoItemBody.html( this.views.todoItemlistIndex.render().el )
    //this.commitBody.html( this.views.commitlistIndex.render().el )
    return this;
  },
  show: function(content) {
    this.clearViews();
    var todoItem = this.todoItems.where({content: content});
    if (todoItem.length>0) {
      var todoItemView = new GitOrganized.Views.TodoItemsIndex({model: todoItem[0]}).render().el;
      this.body.html( todoItemView );
    } else {
      this.navigate("/", true);
    }
    return this;
  },
  clearViews: function() {
    _.each(this.views, function(viewObj) {
      viewObj.$el.empty();
    });
    return this;
  }
});
