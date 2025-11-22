class_name Hurtbox extends Area2D

var entity : EntityResource

# Função utilizada para dizer que tomou o dano, no qual a Hitbox a encontra
# através da detecção de colisão com a área do Hurtbox.
func TakeDamage( damage: float ) -> void:
	entity = get_parent().entity

	entity.TakeDamage(damage)
