extends Node

var obstacleCounter = 0
var GlobalSpeed = -30


func _on_score_counter_area_entered(area):
	obstacleCounter += 1
	print(obstacleCounter)
