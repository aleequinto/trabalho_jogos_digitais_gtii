class_name Jogador extends Area2D
#criando o script do jogador

# Variáveis de controle  
# Define a velocidade de movimento do jogador  
var velocity: float = 120
 
# define o eixo que o jogador vai andar
var direcao_index = 0 
# Movimento nas direções: cima, esquerda, baixo, direita respectivamente
var direcoes = [Vector2.UP, Vector2.LEFT, Vector2.DOWN, Vector2.RIGHT]  


# Controlar o tamanho do personagem
var scale_factor : float = 1.0
# Velocidade com que o personagem aumenta
var scale_speed : float = 0.1  

# Chama o nó do café
@onready var sprite = Coffe


# Inicializa a direção do jogador  
func _ready():  
# O jogador começa se movendo para cima  
	direcao_index = 0  

# Atualiza a posição do jogador com base na direção atual  
func _process(delta):  
	
	position += direcoes[direcao_index] * velocity * delta  

	# Verifica se o jogador ultrapassou as bordas da tela  
	if position.x < 0 or position.x > 240 or position.y < 30 or position.y > 425:  
		#Caso ultrapasse, vai para a tela de game over
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	

func _input(event):  
	# Verifica se o evento de entrada é um clique do mouse  
	if event is InputEventMouseButton and event.pressed:  
		# Muda a direção na ordem desejada (cima, esquerda, baixo, direita)  
		direcao_index = (direcao_index + 1) % direcoes.size()  
		scale_factor += scale_speed
		
