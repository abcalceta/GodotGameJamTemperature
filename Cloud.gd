extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var list = ["res://Assets/cloud/cloud1.png","res://Assets/cloud/cloud2.png",
			"res://Assets/cloud/cloud3.png","res://Assets/cloud/cloud4.png",
			"res://Assets/cloud/cloud5.png","res://Assets/cloud/cloud6.png",
			"res://Assets/cloud/cloud7.png","res://Assets/cloud/cloud8.png",
			"res://Assets/cloud/cloud9.png"]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	texture = load(list[randi()%9])
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
