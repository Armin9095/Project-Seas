extends Node

@onready var music_player = $MusicPlayer

func play_music(audio_stream):
	if music_player.playing and music_player.stream == audio_stream:
		return
	
	
	music_player.stream = audio_stream
	music_player.play()

func stop_music():
	music_player.stop()
