window.GitOrganized = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Hello from Backbone!');
    var repoRouter = new GitOrganized.Routers.Repos({
    });
    var commitRouter = new GitOrganized.Routers.Commits({
    });
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  GitOrganized.initialize();
});
