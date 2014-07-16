GitOrganized.Routers.Repos = Backbone.Router.extend({
  routes: {
    "":"index"
  },
  initialize: function(options) {
    this.repos = new GitOrganized.Collections.Repos();
    //this.commits = new GitOrganized.Collections.Commits();
    this.todoItems = new GitOrganized.Collections.TodoItems();
    var that = this;

    this.reposListIndex = new GitOrganized.Views.ReposListIndex({
      collection: this.repos
    });

    // this.commitsListIndex = new GitOrganized.Views.CommitsListIndex({
    //   collection: this.commits
    // });


    this.repos.fetch({async: false});

    //this.commits.fetch({async: false});

    this.views = {
      repolistIndex: this.reposListIndex
      //commitlistIndex: this.commitsListIndex
    };

    this.repoBody = $('.repos');
    //this.commitBody = $('commits');
    return this;
  },
  index: function() {
    this.repoBody.html( this.views.repolistIndex.render().el )
    //this.commitBody.html( this.views.commitlistIndex.render().el )
    return this;
  }
});
