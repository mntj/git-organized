window.GitOrganized = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Hello from Backbone!');
    var repoRouter = new GitOrganized.Routers.Repos({
    });
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  GitOrganized.initialize();

  $("select").change(function(e){
    var repoId = parseInt($('select').children(':selected')[0].children[0].value)
    console.log(repoId);
    var commits = new GitOrganized.Collections.Commits();
    var commitListIndex = new GitOrganized.Views.CommitsListIndex({
      collection: commits
    });
    var commitBody = $('.commits');
    commitBody.html( commitListIndex.render().el )
    commits.fetch({
      async: false,
      url: '/repos/'+String(repoId)+'/commits',
      success: function(data) {
        debugger;
      }
    });
  });

});
