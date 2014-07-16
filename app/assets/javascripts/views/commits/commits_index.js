GitOrganized.Views.CommitsIndex = Backbone.View.extend({
  tagName: 'li',
  template: JST['commits/index'],
  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
  },
  render: function() {
  this.$el.html( this.template( {commit: this.model.attributes} ));
  return this;
  }
});

GitOrganized.Views.CommitsListIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
  },
  tagName: 'ul',
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(commit) {
      var commitView = new GitOrganized.Views.CommitsIndex({model: commit});
      that.$el.prepend(commitView.render().el);
    });
    return this;
  }
});
