extends KinematicBody2D

export var speed = 100
export var max_left = -100
export var max_right = 100
export var direction = -1

var velocity = Vector2()
var startX

func _ready():
	startX = self.get_position().x

func _physics_process(delta):

	if self.get_position().x >= (startX + max_right):
		direction = -1
		$Sprite.flip_h = false
	elif self.get_position().x <= (startX + max_left):
		direction = 1
		$Sprite.flip_h = true
	
	velocity.x = direction * speed
	velocity = move_and_slide(velocity, Vector2.UP)
	

func _on_collision_checker_body_entered(body):
	body.hurt()
