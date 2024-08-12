extends Area2D

var speed = -30
var destroyPoint = -84



func _process(delta):
	position.x += speed * delta
	
	if position.x <= destroyPoint:
		queue_free()
