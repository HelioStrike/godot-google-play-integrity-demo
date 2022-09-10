extends Node2D

var integrity;

# Called when the node enters the scene tree for the first time.
func _ready():
	if Engine.has_singleton("GodotGooglePlayIntegrity"):
		integrity = Engine.get_singleton("GodotGooglePlayIntegrity")
		integrity.connect("request_completed", self, "_integrity_request_completed")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		integrity.requestIntegrityToken("lolololololololo")

func _integrity_request_completed(token):
	print("Integrity token received: " + token)
	pass
