extends Node

# ============================================
# PLAYER DATA
# ============================================

var player_name: String = ""
var starting_city_id: String = ""
var player_starting_city: CityData = null

# ============================================
# GAME STATE
# ============================================

var current_money: int = 1000
var game_started: bool = false

# ============================================
# SETUP FUNCTIONS
# ============================================

# Chiamata da setup_game quando il giocatore crea il personaggio
func setup_new_game(merchant_name: String, city_id: String):
	player_name = merchant_name
	starting_city_id = city_id
	current_money = 1000
	game_started = false
	
	debug_print_info()

# Chiamata da WorldEconomy dopo aver creato tutte le città
func set_starting_city(city: CityData):
	player_starting_city = city
	game_started = true
	print("✓ Città di partenza impostata: ", city.city_name)

# ============================================
# DEBUG FUNCTIONS
# ============================================

func debug_print_info():
	print("========================================")
	print("[GAME MANAGER] Dati Salvati:")
	print("Merchant Name: ", player_name)
	print("Starting City ID: ", starting_city_id)
	print("Current Money: ", current_money)
	print("Game Started: ", game_started)
	if player_starting_city:
		print("Starting City Name: ", player_starting_city.city_name)
	print("========================================")

# ============================================
# GODOT CALLBACKS
# ============================================

func _ready() -> void:
	print("[GameManager] Inizializzato")

func _process(_delta: float) -> void:
	pass
