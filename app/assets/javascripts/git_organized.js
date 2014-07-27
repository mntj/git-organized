window.GitOrganized = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var repoRouter = new GitOrganized.Routers.Repos({
    });
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  $('body').hide();
  $('.repo-container').hide();
  if (typeof currentUser !== 'undefined') {
    $('.repo-container').fadeIn(950);
  }
  GitOrganized.initialize();
  $('body').fadeIn(1200);
  $(".commits, .commit-header, .todos").hide();
  $("input").addClass("btn btn-default");
});
