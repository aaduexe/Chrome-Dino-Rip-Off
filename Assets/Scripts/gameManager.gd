extends Node
var score = 0
var obsSpawnPoint_x = 84
var obsSpawnPoint_y = -26
var obsInstance = [load("res://Assets/Scenes/obstacle_1.tscn")]

func _ready():
	var newObstacle = obsInstance[0].instantiate()
	newObstacle.position = Vector2(obsSpawnPoint_x, obsSpawnPoint_y)
	add_child(newObstacle)
	

func scoreIncrease():
	score += 1
	print(score)


func _on_score_counter_area_entered(_area):
	scoreIncrease()
