class_name Coffe extends Area2D  

signal collected  # Sinal emitido quando o café é coletado   

var spawn_area_max: Vector2  # Ponto máximo para o spawn  
var margin: int = 30  # Margem para evitar que o café apareça muito próximo das bordas  
var coffee_size: Vector2 = Vector2(30, 30)  # Ajuste de acordo com o tamanho real do café  

func _ready() -> void:  
	spawn_area_max = get_viewport().size  # Define o ponto máximo para o spawn  

func _physics_process(delta: float) -> void:
	#Mantem as funções do jogo mesmo quando roda em tela expandida
	var rect:Rect2 = get_viewport_rect()
	spawn_area_max = rect.size
	
# Função para gerar café em um novo local aleatório  
func spawn_new_coffee():  
	var new_coffee = preload("res://Prefabs/coffe.tscn").instantiate()  # Caminho para a cena do café  

	# Define a área segura para aparecer o café  
	var safe_spawn_area_min = Vector2(margin, margin)  
	var safe_spawn_area_max = spawn_area_max - Vector2(coffee_size.x + margin, coffee_size.y + margin)  
	
	# Gera a posição aleatória dentro da área segura  
	new_coffee.position = Vector2(  
		randf_range(safe_spawn_area_min.x, safe_spawn_area_max.x),   
		randf_range(safe_spawn_area_min.y, safe_spawn_area_max.y)  
	)  

	get_parent().add_child(new_coffee)  # Adiciona o novo café à cena  

func _on_area_entered(area: Area2D) -> void:  
	print("Área: ", area)  # Imprime a área que entrou em contato  
	if area.name == "Jogador":  # Verifica se a área é o jogador  
		emit_signal("collected")  # Emite o sinal de coleta   
		spawn_new_coffee()  # Gera novo café  
		queue_free()  # Remove o café atual  
		Globals.coffe += 1  # Adiciona 1 ao total global  
		print(Globals.coffe)  # Imprime a nova quantidade total de café
