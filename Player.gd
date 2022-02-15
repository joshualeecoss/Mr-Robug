extends KinematicBody2D

#physics
var speed = 150
var jumpForce = 400
var gravity = 800

var velocity = Vector2()
var grounded = false
var unlocked = false
var robot = false

onready var flag = get_node("../Flag")
onready var menuPopup = get_node("../PopUp")

func _physics_process(delta):
	velocity.x = 0
	
	# inputs for movement
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		$Sprite.play("moving")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_right"):
		velocity.x += speed
		$Sprite.play("moving")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")

	if not is_on_floor():
		$Sprite.play("air")
	
	
	# apply movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# gravity
	velocity.y += gravity * delta
	
	# input for jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
		$JumpSound.play()


func _on_doorway_body_entered(body):
	if unlocked == true and robot == true:
		
		queue_free()
		flag.get_node("AnimationPlayer").play("Flag_Rise")


func _on_key_collected():
	$CollectSound.play()
	unlocked = true

func hurt():
	$HitSound.play(0.1)
	set_modulate(Color(1, 0.3, 0.3, 0.4))
	
	Input.action_release("left")
	Input.action_release("right")
	
	
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(1, false)
	
	$Timer.start()

func _on_Timer_timeout():
	menuPopup.popup()

func _on_Robot_robot_complete():
	robot = true

func _on_fallzone_body_entered(body):
	$HitSound.play()
	menuPopup.popup()
