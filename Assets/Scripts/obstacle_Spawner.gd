extends Node

var children = []
var targetObject = null
var target_x = null
var spawnDistant = 0
var is_spawnable = false
@onready var on_click = $"../CanvasLayer/GameOver/OnClick"
@onready var on_select = $"../CanvasLayer/GameOver/OnSelect"

var obsSpawnPoint_x = 150
var obsSpawnPoint_y = -25

var air_brone_point_y = -42
var obsInstance = [load("res://Assets/Scenes/spike0.tscn"),load("res://Assets/Scenes/spike1.tscn"), load("res://Assets/Scenes/spikeTrad.tscn"), load("res://Assets/Scenes/air_borne.tscn")]
var obsIndex = 0

func spawnSpike():
	var newSpike = obsInstance[obsIndex].instantiate()
	if obsIndex == 3:
		newSpike.position = Vector2(obsSpawnPoint_x, air_brone_point_y)
	else:
		newSpike.position = Vector2(obsSpawnPoint_x, obsSpawnPoint_y)
	add_child(newSpike)
	generateRandom_chooser()

func _ready():
	generateRandom_spawner()
	generateRandom_chooser()

func _process(_delta):
	children = get_children()
	targetObject = children[children.size()-1]
	target_x = targetObject.position.x
	GameManager.speedIncreaser()


	if target_x < spawnDistant:
		if is_spawnable == true:
			spawnSpike()
			generateRandom_spawner()
			is_spawnable = false
		else:
			is_spawnable = true


func generateRandom_spawner():
	spawnDistant = randi_range(60,120)

func generateRandom_chooser():
	obsIndex = randi_range(0,obsInstance.size()-1)


func _on_button_pressed():
	on_click.play()
	AudioServer.set_bus_effect_enabled(2,0,false)
	Engine.time_scale = 1
	GameManager.obstacleCounter = 0
	GameManager.distance = 0
	GameManager.increasePoint = 5
	GameManager.GlobalSpeed = -30
	GameManager.Globaltutorial = false
	GameManager.player_alive = true
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	on_click.play()
	Engine.time_scale = 1
	GameManager.obstacleCounter = 0
	GameManager.distance = 0
	GameManager.increasePoint = 5
	GameManager.GlobalSpeed = -30
	GameManager.Globaltutorial = false
	GameManager.player_alive = true
	get_tree().change_scene_to_file("res://Assets/Scenes/main_screen.tscn")

func _hover_entered():
	on_select.play()
