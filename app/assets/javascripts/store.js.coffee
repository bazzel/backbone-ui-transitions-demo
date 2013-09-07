# http://emberjs.com/guides/models/defining-a-store/
DS.RESTAdapter.configure 'plurals',
  product_category: 'product_categories'

UiDemo.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()
