extends Control
@onready var on_select = $OnSelect
@onready var on_click = $OnClick

func _on_start_button_up():
	on_click.play()
	AudioServer.set_bus_effect_enabled(2,0,false)
	get_tree().change_scene_to_file("res://Assets/Scenes/EndlessRunner.tscn")


func _on_quit_button_up():
	get_tree().quit()

func _on_mouse_entered():
	on_select.play()
