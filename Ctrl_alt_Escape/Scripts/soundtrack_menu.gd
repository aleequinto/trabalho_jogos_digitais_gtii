class_name AudioMenu extends AudioStreamPlayer

#Faz com que a música fque em loop
func _on_finished() -> void:
	$".".play()
