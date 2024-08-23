extends Node2D


var destroyPoint = -400

var scene: PackedScene = load("res://Assets/Scenes/Platform.tscn")
var newPlatformPosition = 736

func _process(delta):
	var speed = GameManager.GlobalSpeed
	position.x += speed*delta
	if position.x <= destroyPoint:
		var newPlatform = scene.instantiate()
		newPlatform.position = Vector2(newPlatformPosition, position.y)
		get_parent().add_child(newPlatform)
		queue_free()
	
