GitOrganized.Routers.Commits = Backbone.Router.extend({
  routes: {
    "":"index"
  },
  initialize: function(options) {
    this.commits = new GitOrganized.Collections.Commits();
    var that = this;

    this.commitsListIndex = new GitOrganized.Views.CommitsListIndex({
      collection: this.commits
    });

    this.commits.fetch({async: false});

    this.views = {
      listIndex: this.commitsListIndex
    };

    this.body = $('.commits');
    return this;
  },
  index: function() {
    this.body.html( this.views.listIndex.render().el )
    return this;
  }
});
