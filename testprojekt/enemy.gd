extends CharacterBody2D
class_name Enemy


const MAX_SPEED = 350
const ACC = 150

#kommer difineras av föräldarna som har åtkomst till sina barn 
var player = null

func _physics_process(delta: float) -> void:
	if player:
		var direction_to_player = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction_to_player*MAX_SPEED, ACC*delta)
		move_and_slide()
	
	


func _on_player_detect_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
