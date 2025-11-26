extends State

var enemy : EnemyBehaviour
var animationFinished : bool = false


func Enter() -> void:
	enemy = entity

	# Conecta o sinal de quando a animação acabar.
	enemy.animationPlayer.connect("animation_finished", OnAnimationFinished)

	# Seta a velocidade dele para zero.
	enemy.velocity = Vector2.ZERO

	enemy.StartAnimation(self)


func Update(_delta: float) -> void:
	# Caso a animação de morte tenha terminado, o inimigo irá desaparecer lentamente.
	if animationFinished:
		if enemy.sprite.self_modulate.a > 0:
			# Ele irá ficar mais transparente a cada 0.8 segundos.
			enemy.sprite.self_modulate.a -= _delta * 0.8
		
		# Caso não tenha como ficar mais transparente, irá remove-lo da cena.
		else:
			enemy.queue_free()

# Ativa a função quando a animação "Die" for finalizada.
func OnAnimationFinished(animationName: String) -> void:
	if animationName == "Die":
		animationFinished = true