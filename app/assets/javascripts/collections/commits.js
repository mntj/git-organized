GitOrganized.Collections.Commits = Backbone.Collection.extend({
  model: GitOrganized.Models.Commit,
  url: '/repos/:repo_id/commits'
});
