class_name GameOver extends Control
#Criando o script da cena de game over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.coffe = 0  # Redefine o contador assim que a cena de game over é carregada  


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	#Reeinicia o jogo
	get_tree().change_scene_to_file("res://Scenes/play_game.tscn")



func _on_quit_pressed() -> void:
	#Fecha a janela do jogo
	get_tree().quit()
	
	
