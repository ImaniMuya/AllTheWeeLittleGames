extends StaticBody2D

var rng = RandomNumberGenerator.new()
var screen_size
var bot_types = ["active", "deactive"]

export var is_active = 0
export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	add_to_group("bots")
	screen_size = get_viewport_rect().size
	#print (screen_size.x)
	is_active = randi() % bot_types.size()
	$AnimatedSprite.animation = bot_types[is_active]
	$AnimatedSprite.play()
	position.y = -10
	position.x = rand_range(0, 400)
	#print(is_active)
	if is_active == 0:
		set_collision_layer_bit(3,true)
	else:
		set_collision_layer_bit(4,true)
	
	#print (position.x)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#check for collision?? if bot active then you cannot stand on it.



func _on_Area2D_body_entered(body):
	if (get_collision_layer_bit(3)):
		print("death")
	#pass # Replace with function body.
