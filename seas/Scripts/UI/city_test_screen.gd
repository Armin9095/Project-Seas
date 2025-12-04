extends Control

# Riferimenti UI di test città
@onready var city_name_label = $MarginContainer/VBoxContainer/CityNameLabel
@onready var inventory_label = $MarginContainer/VBoxContainer/InventoryLabel
@onready var prices_label = $MarginContainer/VBoxContainer/PricesLabel

func _ready():
	display_city()

func display_city():
	# Verifica che ci sia una città assegnata
	if GameManager.player_starting_city == null:
		city_name_label.text = "ERROR: No City!"
		inventory_label.text = "No data available"
		prices_label.text = "No data available"
		print("⚠ ERROR: GameManager.player_starting_city is null!")
		return
	
	var city = GameManager.player_starting_city
	# Mostra nome città
	city_name_label.text = city.city_name
	var inventory_text = ""
	for good_name in city.city_inventory.keys():
		var quantity = city.city_inventory[good_name]
		inventory_text += good_name + ": " + str(quantity) + " units\n"
	inventory_label.text = inventory_text

	# Costruisci testo prezzi
	var prices_text = ""
	for good_name in city.city_current_prices.keys():
		var price = city.city_current_prices[good_name]
		prices_text += good_name + ": " + str(price) + " coins\n"
	prices_label.text = prices_text
