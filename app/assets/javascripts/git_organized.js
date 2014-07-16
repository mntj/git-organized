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
  // $("select").change(function(e){
  //   // GitOrganized.Views.TodoItemsIndex.getTodos();
  // });
});
