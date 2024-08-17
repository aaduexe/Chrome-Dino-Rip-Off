extends ParallaxBackground

func _process(delta):

	var midBuildSpeed = GameManager.GlobalSpeed / 6.0
	var cloudSpeed = GameManager.GlobalSpeed / 12.0
	var distantSpeed = GameManager.GlobalSpeed / 24.0
	var speeds = [Vector2(0.0,0.0),Vector2(distantSpeed, 0.0), Vector2(cloudSpeed, 0.0), Vector2(midBuildSpeed, 0.0)]

	var layers = get_children()
	for i in range(layers.size()):
		if layers[i] is ParallaxLayer:
			layers[i].motion_offset += speeds[i] * delta
