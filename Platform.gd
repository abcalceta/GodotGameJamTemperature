extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var isChosen = false
var alreadyPlaying = false
var isMoving = false
var speed = 2
var currentAnimationTime = 0

func _ready():
	if randi()%2 == 0:
		speed *= -1
	randomize()
	isChosen = false
	if randi()%3==0:
		isMoving = true
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if isMoving:
		position.x += speed
		if position.x > (1024-200) or  position.x < 150:
			speed *= -1
		
	if isChosen == false:
		$AnimationPlayer.stop()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	print(globals.cameraPos.y - position.y)
	if globals.cameraPos.y - position.y < 0:
		globals.makeNew = true
		queue_free()

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		globals.hasTouched = true
		print("platform chosen")
		$soundEffect.play()
		$Particles2D.emitting = true
		isChosen = true
		$Timer.start()
		if alreadyPlaying:
			$AnimationPlayer.play("heat up")
			$AnimationPlayer.seek(currentAnimationTime,true)

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		print("platform not chosen")
		$Particles2D.emitting = false
		$AnimationPlayer.stop()
		isChosen = false
	
func _on_Timer_timeout():
	if not alreadyPlaying:
		$AnimationPlayer.play("heat up")
		alreadyPlaying = true
	elif isChosen:
		currentAnimationTime += 0.1
		

func _on_AnimationPlayer_animation_finished(anim_name):
	globals.makeNew = true
	queue_free()
