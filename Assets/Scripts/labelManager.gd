extends Label


@onready var label_score = $"."


func _process(delta):
	var distance_display_int = int(GameManager.distance)
	var KM_distance = GameManager.distance / 1000
	var sin_distance = "%0.2f" % KM_distance
	
	if distance_display_int < 1000:
		label_score.text = "Distance: " + str(distance_display_int) + "m"
	elif distance_display_int >= 1000:
		label_score.text = "Distance: " + str(sin_distance) + "km"
