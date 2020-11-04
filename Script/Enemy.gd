extends Node2D

##<"make sure to put the enemy into the 'enemy' group.">

#signal goDie() 
#var player = load("res://Scripts/character.g")

func _ready():
	#connect("goDie", player, "on_enemy_hit")
	pass
	
func _on_Spikes_body_entered(body):
	body.queue_free()
	#or
	#emit_signal("goDie")
	
func _on_MyBody_body_entered(body):
	queue_free()
