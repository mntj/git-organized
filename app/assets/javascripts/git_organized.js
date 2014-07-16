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
// Needs to be refactored into backbone-on-rails files
$(document).ready(function(){
  $('body').hide();
  GitOrganized.initialize();
  $('body').fadeIn(1200);
  $(".commits, .commit-header").hide();
  $("select").change(function(e){
    GitOrganized.Views.TodoItemsIndex.getTodos();
    $(".commits").hide();
    $('.commits, .commit-header').fadeIn(950);
    var repoId = parseInt($('select').children(':selected')[0].children[0].value)
    console.log(repoId);
    var commits = new GitOrganized.Collections.Commits();
    var commitListIndex = new GitOrganized.Views.CommitsListIndex({
      collection: commits
    });
    var commitBody = $('.commits');
    commitBody.html( commitListIndex.render().el )
    commits.fetch({
      url: '/repos/'+String(repoId)+'/commits',
      success: function(data) {
      }
    });
  });
});
