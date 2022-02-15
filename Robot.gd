extends KinematicBody2D

#physics
var speed = 150
var jumpForce = 400
var gravity = 800

var velocity = Vector2()
var grounded = false
var unlocked = false

onready var player = get_node("../Player")
onready var menuPopup = get_node("../PopUp")

signal robot_complete

func _physics_process(delta):
	velocity.x = player.get("velocity").x
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# gravity
	velocity.y += gravity * delta
	
	if velocity.x < 0:
		$Sprite.flip_h = false
	elif velocity.x > 0:
		$Sprite.flip_h = true


func hurt():
	set_modulate(Color(1, 0.3, 0.3, 0.4))
	Input.action_release("left")
	Input.action_release("right")
	$HitSound.play(0.1)
	
	set_collision_layer_bit(6, false)
	set_collision_mask_bit(1, false)
	
	$Timer.start()

func jump():
	velocity.y -= jumpForce

func _on_Timer_timeout():
	menuPopup.popup()

func _on_doorway_body_entered(body):
	if body.name == "Robot":
		$Signal.start()
	
func _on_Signal_timeout():
	emit_signal("robot_complete")
	queue_free()

func _on_fallzone_body_entered(body):
	$HitSound.play()
	menuPopup.popup()
