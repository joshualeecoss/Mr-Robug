extends AudioStreamPlayer


func levelMusic():
	var sfx = load("res://assets/sounds/Windle-Pixels-8-Bit-Circus_Looping.mp3") 
	sfx.set_loop(true)
	self.set_volume_db(-10)
	self.stream = sfx
	self.play()

func menuMusic():
	var sfx = load("res://assets/sounds/Too-Cool-for-Words.mp3")
	sfx.set_loop(true)
	self.set_volume_db(-10)
	self.stream = sfx
	self.play()

