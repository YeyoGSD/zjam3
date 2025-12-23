extends Control

func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().call_deferred("reload_current_scene")
