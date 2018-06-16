extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	globals.hasTouched = false
	globals.score = 0
	$Player.position.x = 1024/2
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	$ParallaxBackground/Score.text = "Score: "+str(globals.score)


func _on_Player_fallen():
	print("fallen")
	$Player.fallingFadeOut()
	$GameOverSinkIn.start()
	
func _on_GameOverSinkIn_timeout():
	get_tree().change_scene("res://GameOver.tscn")
