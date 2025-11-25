class_name Hurtbox extends Area2D

# Sinal para avisar que tomou dano quando uma hitbox encostar no hurtbox.
signal DamageReceived(damage: float)

# Função utilizada para dizer que tomou o dano, no qual a Hitbox a encontra
# através da detecção de colisão com a área do Hurtbox.
func TakeDamage( damage: float ) -> void:
	print(damage)

	# Emite o sinal, informando o dano.
	DamageReceived.emit(damage)
