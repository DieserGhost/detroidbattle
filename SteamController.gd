extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    Steam.steamInit()

    var SteamRunning = Steam.isSteamRunning()
    if !SteamRunning:
        print("Steam is not running. Please run Steam.")
        return


    var userId = Steam.getSteamID()
    var name = Steam.getFriendPersonaName(userId)
    print("Your Steam name is " + name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
