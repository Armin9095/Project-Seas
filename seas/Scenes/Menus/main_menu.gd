extends Control

@onready var title_label = $MenuContainer/TitleLabel
@onready var new_game_btn = $MenuContainer/NewGameButton

@onready var quit_btn = $MenuContainer/QuitGameButton
@onready var music_toggle = $MusicToggle

@onready var music_on_texture = preload("res://Icons/Music_on.png")
@onready var music_off_texture = preload("res://Icons/Music_off.png")

var is_muted: bool = false

func _ready() -> void:
	print("Menu Loaded")
	
	var track = load("res://Assets/Audio/Rise of the Hansa_Menu.mp3")
	MusicManager.play_music(track)
	
	
	var button_min_size = Vector2(300, 50)
	new_game_btn.custom_minimum_size = button_min_size
	quit_btn.custom_minimum_size = button_min_size
	
	music_toggle.custom_minimum_size = Vector2(50, 50)
	music_toggle.ignore_texture_size = true
	music_toggle.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	setup_button_style(new_game_btn)
	setup_button_style(quit_btn)
	
	new_game_btn.pressed.connect(_on_new_game_pressed)
	quit_btn.pressed.connect(_on_quit_pressed)
	music_toggle.pressed.connect(_on_music_toggle_pressed)
	
	title_label.add_theme_font_size_override("font_size", 36)
	title_label.add_theme_color_override("font_color", Color(1, 0.8, 0.2))


func setup_button_style(button: Button) -> void:
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.4, 0.25, 0.15)
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_left = 8
	style.corner_radius_bottom_right = 8
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_color = Color(0.8, 0.6, 0.2)
	button.add_theme_stylebox_override("normal", style)
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_color", Color(1, 0.9, 0.7))

func _on_new_game_pressed() -> void:
	print("Start New Game")
	get_tree().change_scene_to_file("res://Scenes/Menus/setup_game.tscn")

func _on_quit_pressed() -> void:
	print("Ending Game...")
	get_tree().quit()

func _on_music_toggle_pressed() -> void:
	is_muted = !is_muted
	
	if is_muted:
		MusicManager.stop_music()
		music_toggle.texture_normal = music_off_texture
	else:
		var track = load("res://Assets/Audio/Rise of the Hansa_Menu.mp3")
		MusicManager.play_music(track)
		music_toggle.texture_normal = music_on_texture
