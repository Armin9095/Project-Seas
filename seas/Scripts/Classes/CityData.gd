extends Resource
class_name CityData

@export var city_name: String = "City"
@export var id: String = ""
@export var is_discovered: bool = true

@export var city_inventory: Dictionary = {}
@export var city_current_prices: Dictionary = {}

func initialize_market(Commodities_List: Array):
	for commodity in Commodities_List:
		city_inventory[commodity.name] = 0
		city_current_prices[commodity.name] = commodity.base_price
