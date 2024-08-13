extends Area2D

var speed = GameManager.GlobalSpeed
var destroyPoint = -84.0



func _process(delta):
	position.x += speed * delta

	
	if position.x <= destroyPoint:
		queue_free()
	

