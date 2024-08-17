extends Label


@onready var label_score = $"."


func _process(delta):
	var distance_display_int = int(GameManager.distance)
	var sin_distance = roundf(distance_display_int / 1000)
	if distance_display_int < 1000:
		label_score.text = "Distance: " + str(distance_display_int) + "m"
	elif distance_display_int >= 1000:
		label_score.text = "Distance: " + str(sin_distance) + "km"
