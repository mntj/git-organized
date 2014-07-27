GitOrganized.Routers.Repos = Backbone.Router.extend({
  routes: {
    "":"index"
    //"repos/:repo_id/todo_items":"show"
  },
  initialize: function(options) {
    this.repos = new GitOrganized.Collections.Repos();

    var that = this;

    this.reposListIndex = new GitOrganized.Views.ReposListIndex({
      collection: this.repos
    });

    this.repos.fetch({async: false});

    this.views = {
      repolistIndex: this.reposListIndex
    };

    this.repoBody = $('.repos');
    return this;
  },
  index: function() {
    this.repoBody.html( this.views.repolistIndex.render().el )
    return this;
  },
  // show: function(content) {
  //   this.clearViews();
  //   var todoItem = this.todoItems.where({content: content});
  //   if (todoItem.length>0) {
  //     var todoItemView = new GitOrganized.Views.TodoItemsIndex({model: todoItem[0]}).render().el;
  //     this.body.html( todoItemView );
  //   } else {
  //     this.navigate("/", true);
  //   }
  //   return this;
  // },
  clearViews: function() {
    _.each(this.views, function(viewObj) {
      viewObj.$el.empty();
    });
    return this;
  }
});
