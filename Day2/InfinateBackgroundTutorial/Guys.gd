extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("astroids")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 1

func _on_VisibilityNotifier2D_screen_exited():
	    queue_free()
 