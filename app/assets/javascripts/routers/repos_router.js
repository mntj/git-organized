GitOrganized.Routers.Repos = Backbone.Router.extend({
  routes: {
    "":"index"
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
  clearViews: function() {
    _.each(this.views, function(viewObj) {
      viewObj.$el.empty();
    });
    return this;
  }
});
