extends Node2D

var integrity;

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Godot app is starting!")
	if Engine.has_singleton("GodotGooglePlayIntegrity"):
		integrity = Engine.get_singleton("GodotGooglePlayIntegrity")
		# For Godot 4
		# integrity.connect("integrity_token_received", self._integrity_request_completed)
		
		# For earlier godot versions
		integrity.connect("integrity_token_received", self, "_integrity_request_completed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		integrity.requestIntegrityToken("<your-project-id>", "noncenoncenoncenoncenoncenoncenoncenonce")

func _integrity_request_completed(token):
	print("Integrity token received: " + token)
