extends Node

@onready var distance_covered = $"../CanvasLayer/DistanceCovered"
@onready var use_space = $"Use Space"
@onready var do_not_touch_the_obstacle = $"Do Not touch the obstacle"
@onready var down_arrow = $"Down Arrow"
@onready var camera_2d = $"../Blob/Camera2D"


var tutorial = GameManager.Globaltutorial
var space_passed = false
var do_not_touch = false
var down_arrow_passed = false



func _process(delta):
	# Finding how much camera moves and storing in variable to influnce the score tags.



	var distance_display_int = int(GameManager.distance)
	var KM_distance = GameManager.distance / 1000
	var sin_distance = "%0.2f" % KM_distance


	if tutorial == true:
		if down_arrow_passed == false:
			down_arrow.position.x += delta * GameManager.GlobalSpeed
			if down_arrow.position.x < -370:
				down_arrow_passed = true
				down_arrow.queue_free()

		if do_not_touch == false:
			do_not_touch_the_obstacle.position.x += delta * GameManager.GlobalSpeed
			if do_not_touch_the_obstacle.position.x < -370:
				do_not_touch = true
				do_not_touch_the_obstacle.queue_free()

		if space_passed == false:
			use_space.position.x += delta * GameManager.GlobalSpeed
			if use_space.position.x < -25 and use_space.position.x > -68:
				Engine.time_scale = 0.5
			else:
				Engine.time_scale = 1
			if use_space.position.x < -370:
				space_passed = true
				use_space.queue_free()
	else:
		use_space.visible = false

	if distance_display_int < 1000:
		distance_covered.text = "Distance: " + str(distance_display_int) + "m"
	elif distance_display_int >= 1000:
		distance_covered.text = "Distance: " + str(sin_distance) + "km"
	
