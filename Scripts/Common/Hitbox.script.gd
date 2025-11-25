class_name Hitbox extends Area2D

var entity : EntityResource

func _ready() -> void:
	DisableHitbox()

# Utilizado no meio do AnimationPlayer para ativar a hitbox.
func EnableHitbox() -> void:
	self.monitoring = true
	self.visible = true


# Utilizado no meio do AnimationPlayer para desativar a hitbox.
func DisableHitbox() -> void:
	self.visible = false
	self.monitoring = false


# Quando uma outra área entrar em contato, chamará a função.
func SignalOnAreaEntered(area: Area2D) -> void:
	# Se for um Hurtbox em contato...
	if area is Hurtbox:
		# area.TakeDamage(damage)
		area.TakeDamage(1)
