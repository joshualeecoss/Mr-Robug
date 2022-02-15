extends KinematicBody2D

var velocity = Vector2()
var gravity = 800
export var speed = 50
export var direction = -1

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += gravity * delta
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_collision_checker_body_entered(body):
	set_collision_layer_bit(2, false)
	body.hurt()
