extends KinematicBody2D


var speed = 1000
var move = Vector2()
var flag = false
var HP = 100

func _physics_process(delta):
	if flag == true:
		var dir = $"../Hero" .position - position
		move = dir.normalized() * speed
		move_and_slide(move)
		
		#print(dir)
		for number in get_slide_count():
			var object = get_slide_collision(number).collider
			if object.name =="Hero":
				object.yron()
				print("lox")


func _on_Area2D_body_entered(body):
	if body.name == "Hero":
		flag = true
		$CanvasLayer/ProgressBar.visible = true
		$CanvasLayer/Label.visible = true


func _on_Area2D_body_exited(body):
	if body.name == "Hero":
		flag = false
		$CanvasLayer/ProgressBar.visible = false
		$CanvasLayer/Label.visible = false
		
func hit():
	HP -= 10
	if HP<= 0:
		queue_free()
		$"../CanvasLayer/win".visible = true
	$CanvasLayer/ProgressBar.value = HP
