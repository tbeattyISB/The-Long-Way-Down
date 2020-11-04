extends Area2D



func _on_dash_body_entered(body):
	queue_free()
	
