extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var pastPos = position.y
	if (position.y - (get_parent().get_node("Player").position.y  - 350))>0 and globals.hasTouched:
		var goal = get_parent().get_node("Player").position.y  - 350
		
		position.y = position.y + (goal - position.y)*0.08
	
	
	globals.cameraPos = position
	
	if Input.is_action_pressed("ui_up"):
		position.y -= 10
	if Input.is_action_pressed("ui_down"):
		position.y += 10