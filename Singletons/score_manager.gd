extends Node

var score: int = 0
var high_score: int = 0

func reset_score() -> void:
	score = 0
	
func increment_score() -> void:
	score += 1
	if score > high_score:
		high_score = score
	SignalManager.on_score_updated.emit()
