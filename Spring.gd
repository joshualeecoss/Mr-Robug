extends Area2D


func _on_Spring_body_entered(body):
	if body.is_on_floor() or body.velocity.y > 0:
		$Sprite.play("up")
		$SpringSound.play()
		$Timer.start()
		body.jump()


func _on_Timer_timeout():
	$Sprite.play("down")
