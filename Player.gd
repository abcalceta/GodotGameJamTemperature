extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var mousePos = Vector2(1024/2,0)
var gravity = 9.8 * 8
var acceleration = 0
var onGround = false

var donePlayingWalkSound = true

signal fallen


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	var pointingTo = (mousePos - global_position)*5
	if abs(pointingTo.x) < 5:
		pass
	elif pointingTo.x > 0:
		$PlayerSprite.scale.x = 1
	else:
		$PlayerSprite.scale.x = -1
	acceleration += gravity
	var result = move_and_slide(Vector2(pointingTo.x,acceleration))
	if is_on_wall():
		onGround = true
		acceleration = 0
		
		if abs(pointingTo.x) < 50:
			$PlayerSprite.play("idle")
		else:
			$PlayerSprite.play("walk")
			if donePlayingWalkSound:
				$walkSound.play()
				donePlayingWalkSound = false
		
	else: 
		onGround = false

func _input(event):
	# Mouse in viewport coordinates
	if Input.is_action_pressed("jump"):
		#print("Mouse Click/Unclick at: ", event.position)
		jump()
	if event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		mousePos = event.position
		
func jump():
	$PlayerSprite.play("jump")
	if onGround:
		$jumpSound.play()
		print("jump")
		acceleration = -gravity * 20
		

func _on_Area2D_body_entered(body):
	if body == self:
		emit_signal("fallen")

func fallingFadeOut():
	$AnimationPlayer.play("die")

func _on_walkSound_finished():
	donePlayingWalkSound = true
