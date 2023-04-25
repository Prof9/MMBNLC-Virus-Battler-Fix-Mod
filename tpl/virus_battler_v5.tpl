@archive virus_battler_v5
@size 70

script 52 mmbn6-lc {
	// Give the chip reward if:
	// - Player does not own the chip, OR:
	// - Flag not set - player has not received chip reward here yet
	checkChipCode
		chip = 280
		code = D
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 58
	checkFlag
		flag = 496
		jumpIfTrue = continue
		jumpIfFalse = 58
	jump
		target = 55
}
script 58 mmbn6-lc {
	mugshotShow
		mugshot = MrProgGold
	msgOpen
	"""
	AMAZING!!
	WELL DONE!!
	I LOSE!!
	"""
	keyWait
		any = false
	clearMsg
	"""
	YOU'VE COMPLETED
	ALL OF THE MATCHES!
	HERE IS YOUR GIFT!!
	"""
	keyWait
		any = false
	clearMsg
	mugshotHide
	itemGiveChip
		chip = 280
		code = D
		amount = 1
	playerAnimateObject
		animation = 24
	printCurrentNavi
	"""
	 got:
	"
	"""
	printChip
		buffer = 0
		chip = 280
	" "
	printCode
		buffer = 0
		code = D
	"\"!!"
	keyWait
		any = false
	playerFinish
	playerResetObject
	clearMsg
	mugshotShow
		mugshot = MrProgGold
	"CONGRATULATIONS!"
	keyWait
		any = false
	flagSet
		flag = 496
	end
}
