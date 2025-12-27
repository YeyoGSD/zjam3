extends Control

var menu_screen_scene = load("uid://dt5pf8hr7isv5")

func _on_reanudar_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(menu_screen_scene)
