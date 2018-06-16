extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var mousePos = Vector2(0,0)
var gravity = 9.8 * 8
var acceleration = 0
var onGround = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	var pointingTo = (mousePos - global_position)*5
	
	acceleration += gravity
	var result = move_and_slide(Vector2(pointingTo.x,acceleration))
	if is_on_wall():
		onGround = true
		acceleration = 0
	else: 
		onGround = false

func _input(event):
	# Mouse in viewport coordinates
	if Input.is_action_pressed("jump"):
		#print("Mouse Click/Unclick at: ", event.position)
		jump()
	elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		mousePos = event.position
		
func jump():
	if onGround:
		print("jump")
		acceleration = -gravity * 20
		