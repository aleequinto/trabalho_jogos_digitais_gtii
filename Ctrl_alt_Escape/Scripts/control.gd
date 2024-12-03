class_name control extends Control
#contador de café

#Declara variavel 'coffe_couter' e inicializa com o nó Label do caminho indicado
@onready var coffe_couter: Label = $container/coffe_container/coffe_couter

#Função chamada quando o nó esta pronto
func _ready() -> void:
	#Atualiza o texto do Label 'coffe_couter' com o valor de 'Globals.coffe' , formatado com um string de 4 digistos
	coffe_couter.text = str("%04d" % Globals.coffe)

#Função chamada  em cada quando (frame) do jogo 
func _process(delta: float) -> void:
	#Atualiza continuamente o texto do label com o valor atualde 'Globals.coffe' ,  formatado com um string de 4 digistos
	coffe_couter.text = str("%04d" % Globals.coffe)
