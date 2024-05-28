extends KinematicBody2D
var move = Vector2()
var speed = 1200
var HP = 100
var spisok = []
var timer = 0
func _physics_process(delta):
	timer += delta
	if timer >= 1.5:
		if Input.is_action_just_pressed("lkm"):
			for i in spisok:
				i.hit()
			timer = 0
			$fight/AnimatedSprite.frame = 0
			$fight/AnimatedSprite.play("defolt")
			print("wow")
	if Input.is_action_pressed("right"):
		move.x = speed
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("left"):
		move.x = -speed
		$AnimatedSprite.flip_h = false
	else:
		move.x = 0
	move_and_slide(move)
	if Input.is_action_pressed("up"):
		move.y = -speed
	elif Input.is_action_pressed("down"):
		move.y = speed
	else:
		move.y = 0
	move_and_slide(move)
func yron():
	HP -= 0.1
	if HP<=0:
		get_tree().paused = true
		$"../CanvasLayer/lose".visible = true
	$ProgressBar.value = HP
	print ("hp")


func _on_Area2D_body_entered(body):
	if "Red" in body.name:
		spisok.append(body)
		print("spisok_bot")


func _on_Area2D_body_exited(body):
	if "Red" in body.name:
		spisok.erase(body)




