GitOrganized.Views.CommitsIndex = Backbone.View.extend({
  tagName: 'li',
  template: JST['commits/index'],
  initialize: function() {
    this.listenTo(this.model, 'all', this.render)
  },
  render: function() {
  this.$el.html( this.template( this.model.attributes ));
  return this;
  }
});
