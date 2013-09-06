# http://emberjs.com/guides/models/defining-a-store/

UiDemo.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()

