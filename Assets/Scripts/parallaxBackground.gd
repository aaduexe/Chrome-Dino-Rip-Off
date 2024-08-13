extends ParallaxBackground

var midBuildSpeed = -5.0
var cloudSpeed = -2.5
var distantSpeed = -1.2
var speeds = [Vector2(0.0,0.0),Vector2(distantSpeed, 0.0), Vector2(cloudSpeed, 0.0), Vector2(midBuildSpeed, 0.0)]

func _process(delta):
	var layers = get_children()
	for i in range(layers.size()):
		if layers[i] is ParallaxLayer:
			layers[i].motion_offset += speeds[i] * delta
