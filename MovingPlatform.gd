extends KinematicBody2D

export var speed = 100
export var max_left = -100
export var max_right = 100
export var direction = -1

var velocity = Vector2()
var startX
var startY

func _ready():
	startX = self.get_position().x
	startY = self.get_position().y

func _physics_process(delta):

	if self.get_position().x >= (startX + max_right):
		direction = -1
	elif self.get_position().x <= (startX + max_left):
		direction = 1
	
	velocity.x = direction * speed
	self.position.y = startY
	velocity = move_and_slide(velocity, Vector2.UP)
	
