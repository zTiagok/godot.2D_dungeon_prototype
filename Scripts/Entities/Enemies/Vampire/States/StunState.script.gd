extends State

var enemy : EnemyBehaviour
var direction : Vector2

func Enter() -> void:
	enemy = entity

	enemy.StartAnimation(self)

	# Desabilita a hurtbox.
	enemy.hurtbox.set_deferred("monitorable", false)
	enemy.hurtbox.visible = false

	# Pega a direção do player e do inimigo, e retorna a direção em que será
	# necessário receber o knockback.
	direction = (enemy.global_position - enemy.player.global_position).normalized()

	# Conecta a animação para quando ela terminar, trocar o state.
	enemy.animationPlayer.connect("animation_finished", OnAnimationFinished)

func PhysicsUpdate(_delta: float) -> void:
	# Gera o knockback.
	enemy.velocity += direction * enemy.knockbackForceReceived * _delta


func OnAnimationFinished(animationName: String) -> void:
	if animationName == "Stun":
		stateMachine.ChangeState("Idle")

func Exit() -> void:
	# Habilita a hurtbox.
	enemy.hurtbox.set_deferred("monitorable", true)
	enemy.hurtbox.visible = true

	# Desconecta o sinal.
	enemy.animationPlayer.disconnect("animation_finished", OnAnimationFinished)
