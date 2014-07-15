window.GitOrganized = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Hello from Backbone!');
    var router = new GitOrganized.Routers.Repos({
    });
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  GitOrganized.initialize();
});
