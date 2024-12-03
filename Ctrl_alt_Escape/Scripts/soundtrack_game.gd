class_name AudioGame extends AudioStreamPlayer

#Cria um loop do audio na aba game
func _on_finished() -> void:
	$".".play()
