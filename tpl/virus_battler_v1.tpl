@archive virus_battler_v1
@size 61

script 54 mmbn6-lc {
	// Give the chip reward if:
	// - Player does not own the chip, OR:
	// - Flag not set - player has not received chip reward here yet
	checkChipCode
		chip = 126
		code = F
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 58
	checkFlag
		flag = 492
		jumpIfTrue = continue
		jumpIfFalse = 58
	jump
		target = 55
}
script 58 mmbn6-lc {
	mugshotShow
		mugshot = MrProgRed
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
		chip = 126
		code = F
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
		chip = 126
	" "
	printCode
		buffer = 0
		code = F
	"\"!!"
	keyWait
		any = false
	playerFinish
	playerResetObject
	clearMsg
	mugshotShow
		mugshot = MrProgRed
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
	MAYBE ONE IS IN
	A COMP RELATED TO
	WATER...
	"""
	keyWait
		any = false
	flagSet
		flag = 492
	end
}
