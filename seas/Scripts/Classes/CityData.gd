extends Resource
class_name CityData

@export var city_name: String = "City"
@export var id: String = ""
@export var is_discovered: bool = true

@export var city_inventory: Dictionary = {}
@export var city_current_prices: Dictionary = {}

#Inizializzazione del mercato cittadino
func initialize_market(Commodities_List: Array):
	for commodity in Commodities_List:
		var initial_stock = randi_range(50, 200)  # ← Numero casuale
		city_inventory[commodity.name] = initial_stock
		city_current_prices[commodity.name] = commodity.base_price
