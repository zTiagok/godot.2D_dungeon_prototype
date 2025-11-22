class_name PlayerBehaviour extends EntityBehaviour


@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var audio : AudioStreamPlayer2D = $Audio/AudioStreamPlayer2D


var currentDirection : Vector2
var lastDirection : Vector2 = Vector2.RIGHT


func _process(_delta):
	# Salva as teclas de movimentação que o Player estiver apertando no momento.
	currentDirection.x = Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left")
	currentDirection.y = Input.get_action_raw_strength("down") - Input.get_action_raw_strength("up")

	# Normaliza a direção, para que a soma dos vetores nunca exceda à 1, fazendo com que o Player sempre
	# ande na mesma velocidade independente de estar na diagonal ou não.
	currentDirection = currentDirection.normalized()

	# Salva a última direção que o Player estava virado ao ficar parado.
	if currentDirection != Vector2.ZERO:
		lastDirection = currentDirection

func StartAnimation(state: State) -> void:
	# Inicia uma animação com base no nome do estado.
	if state && animationPlayer:
		animationPlayer.play(state.name.capitalize())