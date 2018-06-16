extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	globals.hasTouched = false
	$Player.position.x = 1024/2
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_fallen():
	print("fallen")
	$GameOverSinkIn.start()
	
func _on_GameOverSinkIn_timeout():
	get_tree().change_scene("res://World.tscn")
