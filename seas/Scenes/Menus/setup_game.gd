extends Control

@onready var city_selector = $WindowPanel/MarginContainer/MainLayout/ContentArea/CitySelector
@onready var name_input = $WindowPanel/MarginContainer/MainLayout/ContentArea/NameRow/NameInput

@onready var random_btn = $WindowPanel/MarginContainer/MainLayout/ContentArea/NameRow/RandomBtn
@onready var start_btn = $WindowPanel/MarginContainer/MainLayout/SetupButtonsBar/StartBtn
@onready var back_btn = $WindowPanel/MarginContainer/MainLayout/SetupButtonsBar/BackBtn

var first_names = ["Hinrik", "Johann", "Klaus", "Niklas", "Tiedemann", "Hermann", "Gerhard", "Albrecht", "Bernd", "Diederik", "Godeke", "Lubert", "Marquard", "Wessel", "Arnd", "Bertram", "Evert", "Gottschalk", "Helmich", "Cord"]
var last_names = ["Witte", "Vogler", "Kruse", "Lange", "Schutte", "Bruskow", "Scharpenberg", "van Dorne", "Bere", "Grop", "Holk", "Stenbock", "Krohn", "Moltke", "Pleskow", "Runge", "Schepenstede", "Vorbush", "Warendorp", "Zolner"]



func _ready():
	
	setup_city_selector()
	random_btn.pressed.connect(_on_random_btn_pressed)
	start_btn.pressed.connect(_on_start_btn_pressed)
	back_btn.pressed.connect(_on_back_btn_pressed)
	
	apply_hanseatic_style(start_btn)
	apply_hanseatic_style(back_btn)
	
	var title = $WindowPanel/MarginContainer/MainLayout/TitleLabel
	title.add_theme_color_override("font_color", Color(1, 0.8, 0.2))
	title.add_theme_font_size_override("font_size", 24)

func setup_city_selector():
	city_selector.clear()
	city_selector.add_item("Lubeck")
	city_selector.add_item("Hamburg")
	city_selector.add_item("Danzig")
	city_selector.select(0)

#Genera nome casuale e non salva
func _on_random_btn_pressed():
	print ("Generate Name")
	var random_first = first_names.pick_random()
	var random_last = last_names.pick_random()
	var full_name = random_first + " " + random_last 
	name_input.text = full_name
	name_input.caret_column = full_name.length()
	
func _on_back_btn_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")

func _on_start_btn_pressed():
	if name_input.text == "":
		print("Insert a name")
		return
	var player_name = name_input.text            #es: Georg Stromberg 
	var city_id = get_city_id_from_selector()
	GameManager.setup_new_game(player_name, city_id)
	# Carica la schermata della città selezionata (DA FARE)
	get_tree().change_scene_to_file("res://Scenes/World/CityViews/city_test_screen.tscn")

#Converte il numero della selezione città in ID testuale della città
func get_city_id_from_selector() -> String:
	var selected_index = city_selector.selected
	
	match selected_index:
		0:
			return "city_lubeck"
		1:
			return "city_hamburg"
		2:
			return "city_danzig"
		_:
			return "city_lubeck"  # Default

func apply_hanseatic_style(button: Button):
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.4, 0.25, 0.15) # Marrone legno
	style.corner_radius_top_left = 5
	style.corner_radius_top_right = 5
	style.corner_radius_bottom_left = 5
	style.corner_radius_bottom_right = 5
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_color = Color(0.8, 0.6, 0.2) # Oro
	
	button.add_theme_stylebox_override("normal", style)
	button.add_theme_color_override("font_color", Color(1, 0.9, 0.7)) # Testo panna
