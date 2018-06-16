extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var platformPreload = preload("res://Platform.tscn")
var startingPlatforms = 20
var currentHeight = 0
var gapY = 90

func _ready():
	for height in range(startingPlatforms):
		var newPlatform = platformPreload.instance()
		newPlatform.global_position.y = -height*gapY + (300)
		currentHeight = newPlatform.global_position.y 
		newPlatform.position.x = 200+(randi()%(1024-500))
		add_child(newPlatform)
	pass
	
	

func _process(delta):
	if globals.makeNew == true:
		makeNew()
		globals.makeNew = false
	
	pass
	
func makeNew():
	print("made new")
	currentHeight -= gapY
	var newPlatform = platformPreload.instance()
	newPlatform.position.y = currentHeight
	newPlatform.position.x = 200+(randi()%(1024-500))
	add_child(newPlatform)
