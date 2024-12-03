class_name MainMenu extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Linka o botão Start para a tela do jogo 
func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/play_game.tscn")

# Linka o botão Credits para a tela de créditos
func _on_credits_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

# Linka o botão Quit para o fechamento do jogo
func _on_quit_btn_pressed() -> void:
	get_tree().quit() # 

#Cria um loop na música do menu
func _on_audio_stream_player_finished() -> void:
	$".".play("C:/Users/xandi/Documents/FACULDADE/JOGOS DIGITAIS/ctrl_alt_escape/Assets/soundtrack/the office.mp3")
