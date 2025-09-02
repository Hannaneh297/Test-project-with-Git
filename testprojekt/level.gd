extends CharacterBody2D
class_name Player

signal dead

const MAX_SPEED = 400
const ACC = 1500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left" , "ui_right ", "ui_up" , "ui_down")
	
	#Velocity är fördefinierat av spelet och är knuten till Characterbody
	velocity = velocity.move_toward(direction*MAX_SPEED, ACC*delta)
	
	#Spelarjaget enligt velocity vektorn och hanterar kollisioner
	move_and_slide()

func die():
	hide()
	emit_signal("dead")
