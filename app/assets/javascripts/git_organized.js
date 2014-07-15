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
      var repoId = $('select').children(':selected')[0].children[0].value
      console.log(repoId);
      this.commits = new GitOrganized.Collections.Commits();
      this.commits.fetch({
        async: false,
        data: {repo_id: parseInt(repoId)}
      });
    });

});
