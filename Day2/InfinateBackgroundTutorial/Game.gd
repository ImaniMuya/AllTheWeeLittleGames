extends Node2D

export (PackedScene) var Guys
var score
var screen_size

func _ready():
	randomize()
	$Timer.start()
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	# Create a Mob instance and add it to the scene.
	var guy = Guys.instance()
	add_child(guy)
	guy.position = Vector2(randi()% 600,20)
	