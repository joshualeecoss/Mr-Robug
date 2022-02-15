extends Control

func _ready():
	if not BackgroundMusic.is_playing():
		BackgroundMusic.play()
