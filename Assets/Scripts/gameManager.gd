extends Node

var obstacleCounter = 0
var distance = 0
var increasePoint = 5
var GlobalSpeed = -30

var player_alive = true


func _on_score_counter_area_entered(area):
	obstacleCounter += 1
	
func distanceCovered():
	distance += GlobalSpeed * -1 * 0.008 * get_process_delta_time()

func speedIncreaser():
	if distance >= increasePoint:
		if distance < 200:
			GlobalSpeed -= 10
			increasePoint += 10
		elif distance < 1000 and distance > 200:
			GlobalSpeed -= 10+increasePoint*0.08
			increasePoint += 10+GlobalSpeed*0.007
		else:
			GlobalSpeed -= 5
			increasePoint += 100 * GlobalSpeed*0.007
