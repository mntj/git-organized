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
      listIndex: this.reposListIndex
    }

    this.body = $('.container');
    return this;
  },
  index: function() {
    this.body.html( this.views.listIndex.render().el )
    return this;
  }
});
