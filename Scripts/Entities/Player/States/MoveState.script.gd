extends State


var player : PlayerBehaviour


func Enter() -> void:
	# Apenas altera o nome da variável para ser utilizado como "Player" ao invés de "Entity".
	player = entity

	# Inicia a animação.
	player.StartAnimation(self)

func Update(_delta: float) -> void:
	# Flipa o sprite do Player dependendo da direção.
	if player.lastDirection.x < 0:
		player.sprite.scale.x = -1
	elif player.lastDirection.x > 0:
		player.sprite.scale.x = 1

	# Altera o state do player quando ele atacar.
	if Input.is_action_just_pressed("attack"):
		stateMachine.ChangeState("Attack")


# Função utilizada para checar em tempo físico, para não haver problemas de colisão
# ao calcular nova posição do player.
func PhysicsUpdate(_delta: float) -> void:	
	# Checa se o Player está apertando uma das direções.
	if player.currentDirection != Vector2.ZERO:
		player.velocity = player.currentDirection * player.entity.movementSpeed

		# Habilita a física no player.
		player.move_and_slide()
	# Caso não esteja apertando nada, altera o State.
	else:
		stateMachine.ChangeState("Idle")
