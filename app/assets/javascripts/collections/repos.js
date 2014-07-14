GitOrganized.Collections.Repos = Backbone.Collection.extend({
  model: GitOrganized.Models.Repo,
  url: '/repos'
});
