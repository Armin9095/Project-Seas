extends Node
class_name WorldEconomy

# Array che contiene TUTTE le città 
var all_cities: Array = []

# Funzione  che chiama automaticamente all'avvio
func _ready():
	create_starting_cities()

func create_starting_cities():
	print("Creating Cities...")
	
	#Lubeck
	var lubeck = CityData.new()
	lubeck.city_name = "Lubeck"
	lubeck.id = "city_lubeck"
	lubeck.initialize_market(GameConstants.ALL_COMMODITIES)
	all_cities.append(lubeck)
	print("Created: ", lubeck.city_name)
	
	#Hamburg
	var hamburg = CityData.new()
	hamburg.city_name = "Hamburg"
	hamburg.id = "city_hamburg"
	hamburg.initialize_market(GameConstants.ALL_COMMODITIES)
	all_cities.append(hamburg)
	print("Created: ", hamburg.city_name)
	
	#Danzig
	var danzig = CityData.new()
	danzig.city_name = "Danzig"
	danzig.id = "city_danzig"
	danzig.initialize_market(GameConstants.ALL_COMMODITIES)
	all_cities.append(danzig)
	print("Created: ", danzig.city_name)

# Collega il giocatore alla sua città scelta (to do)

	set_player_starting_city()

# Trova la città scelta dal giocatore e la collega
func set_player_starting_city():
	# Se non c'è una città scelta, salta
	if GameManager.starting_city_id == "":
		print("⚠ Nessuna città di partenza selezionata")
		return
	
	# Cerca la città con l'ID corrispondente
	for city in all_cities:
		if city.id == GameManager.starting_city_id:
			GameManager.set_starting_city(city)
			return
	
	# Se arrivi qui, la città non è stata trovata
	print("⚠ Città non trovata: ", GameManager.starting_city_id)
