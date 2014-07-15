GitOrganized.Views.ReposIndex = Backbone.View.extend({

  tagName: 'option',
  template: JST['repos/index'],
  initialize: function() {
    this.listenTo(this.model, 'all', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
  },
  render: function() {
    this.$el.html( this.template( {repo: this.model.attributes} ));
    return this;
  },
  events: {

   }
});

GitOrganized.Views.ReposListIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
  },
  tagName: 'select',
  render: function() {
    var that = this;
    this.$el.empty()
    _.each(this.collection.models, function(repo) {
      var repoView = new GitOrganized.Views.ReposIndex({model: repo});
      that.$el.prepend(repoView.render().el);
    });
    return this;
  }
});
