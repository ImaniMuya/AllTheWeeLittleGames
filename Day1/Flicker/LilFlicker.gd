extends KinematicBody2D

export var run_speed = 100
var jump_speed = -500
var screen_size
var gravity = 20
const UP = Vector2(0, -1)
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	set_collision_mask_bit(3,true)
	set_collision_mask_bit(4,false)
	#pass # Replace with function body.
func _physics_process(delta):
	velocity.y += gravity
	velocity.x = 0  # The player's movement vector.
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up")

	if right:
		velocity.x += run_speed
	elif left:
		velocity.x -= run_speed
	else:
		velocity.x = 0
	if jump:
		velocity.y = jump_speed
	velocity = move_and_slide(velocity, UP)
	clamp_pos(velocity,delta)

func _process(delta):
	#check_move(delta)
	pass

func start(pos):
	position = pos
	#show()
	#$CollisionShape2D.disabled = false

func check_move(delta):
	pass

	
	
func clamp_pos(velocity, delta):
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

#Maybe add jump animation? Different sprites for l + r orientaion

#should we allow double jumps?
