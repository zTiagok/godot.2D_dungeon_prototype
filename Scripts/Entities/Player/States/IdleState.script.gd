extends State

var player: PlayerBehaviour


func Enter() -> void:
	player = entity
	player.StartAnimation(self)	


func Update(_delta: float) -> void:
	# Checa se o Player está segurando o input de alguma direção.
	if player.currentDirection != Vector2.ZERO:
		stateMachine.ChangeState("Move")

	if Input.is_action_just_pressed("attack"):
		stateMachine.ChangeState("Attack")