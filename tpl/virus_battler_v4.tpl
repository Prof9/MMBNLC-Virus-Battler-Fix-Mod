@archive virus_battler_v4
@size 19

script 14 mmbn6-lc {
	// Give the chip reward if:
	// - Player does not own the chip, OR:
	// - Flag not set - player has not received chip reward here yet
	checkChipCode
		chip = 80
		code = *
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 18
	checkFlag
		flag = 495
		jumpIfTrue = continue
		jumpIfFalse = 18
	jump
		target = 15
}
script 18 mmbn6-lc {
	mugshotShow
		mugshot = MrProgLime
	msgOpen
	"""
	AMAZING!!
	WELL DONE!!
	"""
	keyWait
		any = false
	clearMsg
	"""
	TO COMMEMORATE YOUR
	GREAT VIRUS BUSTING
	SKILL,HERE'S A GIFT!
	"""
	keyWait
		any = false
	clearMsg
	mugshotHide
	itemGiveChip
		chip = 80
		code = *
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
		chip = 80
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	keyWait
		any = false
	playerFinish
	playerResetObject
	clearMsg
	mugshotShow
		mugshot = MrProgLime
	"CONGRATULATIONS!"
	keyWait
		any = false
	clearMsg
	"""
	THERE ARE OTHER
	MR.PROGS THAT ARE
	DIFFERENT COLORS...
	"""
	keyWait
		any = false
	clearMsg
	"""
	YOU SHOULD TRY
	LOOKING FOR THEM.
	"""
	keyWait
		any = false
	clearMsg
	"WHERE ARE THEY?"
	keyWait
		any = false
	clearMsg
	"""
	HAHAHA...
	YOU KNOW...
	"""
	keyWait
		any = false
	clearMsg
	"""
	IT'S AN AREA YOU
	PASS THROUGH
	REGULARLY...
	"""
	keyWait
		any = false
	flagSet
		flag = 495
	end
}
