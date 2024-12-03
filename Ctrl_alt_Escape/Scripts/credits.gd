class_name Credits extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

																																																																																																																																																																		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Direciona o jogador de volta para a tela de menu
func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")
