class_name Boss extends Area2D

# Define a velocidade do Boss
var speed: float = 75 
# Referência ao jogador.  
var target: Node2D = null

# Obtém o nó "Player"
func _ready() -> void:  
	target = get_parent().get_node("Jogador")  

func _process(delta: float) -> void:  
	if target:  
		# Verifica a distância entre o Boss e o jogador.  
		var distance = position.distance_to(target.position)  
	
		# Move o Boss em direção ao jogador.  
		var direction = (target.position - position).normalized()  
		position += direction * speed * delta  

#Colisão com jogador
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Jogador": 
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
