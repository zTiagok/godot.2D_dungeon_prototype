extends State


var player: PlayerBehaviour
@export var attackSound: AudioStream
@export_range(0, 20, 0.5) var decelerateSpeed: float = 2
@export var isAttacking: bool = false


func Enter() -> void:
	# Apenas altera o nome da variável para ser utilizado como "Player" ao invés de "Entity".
	player = entity

	# Inicia a animação de ataque.
	player.StartAnimation(self)

	# Altera a variável para que diga que o player está atacando.
	isAttacking = true


func PhysicsUpdate(_delta: float) -> void:
	# Aplica uma redução de velocidade no player caso o último state fosse o "Move".
	# Caso não, apenas bate parado.
	if stateMachine.lastState.name == "Move":
		# O player irá perder velocidade durante o state.
		player.velocity -= player.velocity * decelerateSpeed *_delta
	else:
		player.velocity = Vector2.ZERO

	# Habilita a física no player.
	player.move_and_slide()


# Função chamada no final da animação de ataque do Player.
func AnimationEndAttack() -> void:
	isAttacking = false

	if player.currentDirection == Vector2.ZERO:
		stateMachine.ChangeState("Idle")
	else:
		stateMachine.ChangeState("Move")


# Função chamada durante a animação de ataque do Player.
func AnimationPlayAttackAudio() -> void:
	# Seleciona o audio que irá tocar.
	player.audio.stream = attackSound

	# Altera a escala aleatoriamente, para que o som nunca fique igual.
	player.audio.pitch_scale = randf_range(0.8, 1.2)

	# Toca o som de ataque.
	player.audio.play()