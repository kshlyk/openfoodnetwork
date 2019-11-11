describe 'AdminOrderCycleIncomingCtrl', ->
  ctrl = null
  scope = null
  event = null
  location = null
  OrderCycle = null
  Enterprise = null
  EnterpriseFee = null

  beforeEach ->
    scope =
      $watch: jasmine.createSpy('$watch')
    location =
      absUrl: ->
        'example.com/admin/order_cycles/27/edit'
    ocInstance = {}

    module('admin.orderCycles')
    inject ($controller) ->
      ctrl = $controller 'AdminOrderCycleIncomingCtrl', {$scope: scope, $location: location, OrderCycle: OrderCycle, Enterprise: Enterprise, EnterpriseFee: EnterpriseFee, ocInstance: ocInstance}

  it 'counts total variants in a list of products', ->
    products = [
                 {variants: [{}]},
                 {variants: [{}]},
                 {variants: [{}, {}, {}]}
               ]

    expect(scope.countVariants(products)).toEqual(5)

  it 'returns zero when products list is null', ->
    expect(scope.countVariants(null)).toEqual(0)

  it 'returns zero when products list is empty', ->
    expect(scope.countVariants([])).toEqual(0)