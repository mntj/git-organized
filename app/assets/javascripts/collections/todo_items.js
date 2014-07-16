GitOrganized.Collections.TodoItems = Backbone.Collection.extend({
  model: GitOrganized.Models.TodoItem,
  url: '/repos/:repo_id/todo_items'
});
