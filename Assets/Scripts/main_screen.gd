extends Control




func _on_start_pressed():
	AudioServer.set_bus_effect_enabled(2,0,false)
	get_tree().change_scene_to_file("res://Assets/Scenes/EndlessRunner.tscn")


func _on_quit_pressed():
	get_tree().quit()
