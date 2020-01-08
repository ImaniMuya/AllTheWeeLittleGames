extends Node2D
export (PackedScene) var BadBots
# Called when the node enters the scene tree for the first time.
func _ready():
	$SpawnTimer.start()
	$LilFlicker.start($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_bots()

func _on_SpawnTimer_timeout():
	var bot = BadBots.instance()
	#add bot to the group
	add_child(bot)

func update_bots():
	#iterate through group and update position
	var move_bots = get_tree().get_nodes_in_group("bots")
	for i in move_bots:
		i.position.y += 1

#function that switches all the bots


func _on_Area2D2_body_entered(body):
	print("I touched it")
	var switch_bots = get_tree().get_nodes_in_group("bots")
	for i in switch_bots:
		if i.get_collision_layer_bit(3):
			i.set_collision_layer_bit(3,false)
			i.set_collision_layer_bit(4,true)
		else:
			i.set_collision_layer_bit(4,false)
			i.set_collision_layer_bit(3,true)
		print (i.get_collision_layer_bit(3))
		print (i.get_collision_layer_bit(4))