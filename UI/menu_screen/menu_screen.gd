extends Control

func _on_tutorial_pressed() -> void:
	var level_tutorial_scene = load("uid://cwghl7o88nkwd")
	get_tree().change_scene_to_packed(level_tutorial_scene)

func _on_salir_pressed() -> void:
	get_tree().quit()
