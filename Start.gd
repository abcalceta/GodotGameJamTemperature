extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Instructions_pressed():
	get_tree().change_scene("res://Instructions.tscn")


func _on_Start_mouse_entered():
	$buttonSound.play()
func _on_Instructions_mouse_entered():
	$buttonSound.play()
func _on_Quit_mouse_entered():
	$buttonSound.play()
