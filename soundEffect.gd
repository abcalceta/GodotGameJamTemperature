extends AudioStreamPlayer2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var list = ["res://Assets/sfx/coldsnap.wav"
			#"res://Assets/sfx/ice.wav"
			]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	stream = load(list[randi()%1])
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
