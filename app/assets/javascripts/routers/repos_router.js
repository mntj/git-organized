GitOrganized.Routers.Repos = Backbone.Router.extend({
  routes: {
    "":"index"
  },
  initialize: function(options) {
    this.repos = new GitOrganized.Collections.Repos();
    var that = this;


  }
});
