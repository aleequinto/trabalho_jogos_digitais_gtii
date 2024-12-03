class_name Telefone extends Node2D  
#Por conta da não funcionalidade correta,
#deixamos o código para a avaliação e retiramos o sprite da cena

var speed = 90  #Define a velocidade do objeto
var timer: Timer  #Define o tempo de queda do objeto
var max_objects = 3 # Número máximo de objetos na tela  
var min_distance = 35  # Distância mínima entre os objetos  
var object_height = 64  # Altura do objeto (ajuste conforme necessário)  

func _ready() -> void:  
	start_spawn_timer()  # Inicia o timer para spawn de objetos  

func _process(delta: float) -> void:  
	# Move todos os filhos (objetos) para baixo  
	for child in get_children():  
		if child is Node2D:  # Verifica se é um nó 2D  
			child.position += Vector2(0, 1) * speed * delta  # Move o objeto para baixo na tela  

			# Remove objetos que saem da tela  
			if child.position.y > get_viewport().size.y:  
				child.queue_free()  # Remove o objeto da cena quando sair da tela  

func spawn_object3():  
	if get_child_count() < max_objects: 
		var object3_scene = preload("res://Prefabs/object_3.tscn")  
		var object3 = object3_scene.instantiate()  

		# Tenta encontrar uma posição válida para o objeto  
		var valid_position_found = false  
		var attempts = 0  
		while not valid_position_found and attempts < 5:  
			object3.position.x = randf_range(0, 208)  # Garantir que a posição X esteja entre 0 e 208
			object3.position.y = -object_height  # Posição Y acima da tela  
			
			valid_position_found = true  
			
			# Verifica se a nova posição não colide com outros objetos
			for child in get_children():  
				if child is Node2D and child != object3:  
					if abs(child.position.x - object3.position.x) < min_distance:  
						valid_position_found = false  # Se estiver muito perto, tenta novamente  
						break  
			attempts += 1  # Aumenta a contagem de tentativas  
		
		if valid_position_found:  
			add_child(object3)  # Adiciona o objeto se a posição for válida  

func start_spawn_timer():  
	timer = Timer.new()  # Cria um novo Timer  
	timer.wait_time = 0.3  # Aguarda 0.3 segundos entre as gerações  
	timer.one_shot = false  # Faz com que o timer se reinicie automaticamente  

	timer.timeout.connect(_on_timer_timeout)  # Conecta o sinal timeout ao método _on_timer_timeout  
	add_child(timer)  # Adiciona o timer como filho do nó atual  
	timer.start()  # Inicia o timer  

func _on_timer_timeout() -> void:  
	spawn_object3()  # Chama a função para gerar um novo objeto  

func _on_area_2d_area_entered(area: Area2D) -> void:  
	if area.name == "Jogador":  
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")  # Troca para a cena de game over
