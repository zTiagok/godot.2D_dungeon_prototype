class_name Hurtbox extends Area2D

# Sinal para avisar que tomou dano quando uma hitbox encostar no hurtbox.
signal DamageReceived(damage: float, knockbackForce: float)

# Função utilizada para dizer que tomou o dano, no qual a Hitbox a encontra
# através da detecção de colisão com a área do Hurtbox.
func EmitDamage( damage: float, knockbackForce: float ) -> void:
	# Emite o sinal, informando o dano.
	DamageReceived.emit(damage, knockbackForce)
