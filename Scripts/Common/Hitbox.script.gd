class_name Hitbox extends Area2D

@export var damage : float

# Quando uma área (Em especial a Hurtbox) entrar em contato, chamará a função.
func SignalOnHit(area: Area2D) -> void:

	# Se realmente for um Hurtbox em contato...
	if area is Hurtbox:
		area.TakeDamage()
