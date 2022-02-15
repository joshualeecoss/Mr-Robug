extends Area2D

func _on_doorway_body_entered(body):
	$DoorSound.play()
