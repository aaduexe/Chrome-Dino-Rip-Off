extends Area2D


var destroyPoint = -84.0
@onready var timer = $"../../Timer"




func _process(delta):
	var speed = GameManager.GlobalSpeed
	position.x += speed * delta

	
	if position.x <= destroyPoint:
		queue_free()
	

func _on_body_entered(body):
	if body.name == "Blob":
		Engine.time_scale = 0.3
		timer.start()




