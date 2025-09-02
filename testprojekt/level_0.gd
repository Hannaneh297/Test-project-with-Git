extends Node2D

@onready var player: Player = $Player
#@onready var enemy: Enemy = $Enemy 

var t = 0 
var is_waiting_on_reload = false

const ENEMY_SCENE = preload("res://enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#enemy.player = player
	player.connect("dead", _on_player_dead) #görs i ready funktionen
	var enemy = ENEMY_SCENE.instantiate()
	enemy.global_position = Vector2(50, 50)
	enemy.player = player
	add_child(enemy)
	#get_node("Enemy")
	#$Enemy
	
func _process(delta: float) -> void:
	if is_waiting_on_reload:
		t += delta
		if t >= 0.5:
			get_tree().reload_current_scene()
	
#lyssna på dead-signalen från player
func _on_player_dead() -> void:
	#await get_tree().create_timer(0.5).timeout
	#get_tree().reload_current_scene() 
	#$RestartTimer.start
	is_waiting_on_reload = true


func _on_restart_timer_timeout() -> void:
	get_tree().reload_current_scene() 
