extends Button

func _on_LevelButton_pressed():
	get_tree().change_scene("res://Level"+self.text+".tscn")
	BackgroundMusic.levelMusic()
