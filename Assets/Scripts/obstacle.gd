extends Area2D


var destroyPoint = -150.0
@onready var timer = $"../../Timer"
@onready var game_over = $"../../CanvasLayer/GameOver"




func _process(delta):
	var speed = GameManager.GlobalSpeed
	position.x += speed * delta

	
	if position.x <= destroyPoint:
		queue_free()
	

func _on_body_entered(body):
	if body.name == "Blob":
		game_over.visible = true
		body.game_over()
		Engine.time_scale = 0.1




