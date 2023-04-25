@archive virus_battler_v2
@size 59

script 54 mmbn6-lc {
	// Give the chip reward if:
	// - Player does not own the chip, OR:
	// - Flag not set - player has not received chip reward here yet
	checkChipCode
		chip = 187
		code = R
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 58
	checkFlag
		flag = 493
		jumpIfTrue = continue
		jumpIfFalse = 58
	jump
		target = 55
}
script 58 mmbn6-lc {
	mugshotShow
		mugshot = MrProgBlue
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
		chip = 187
		code = R
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
		chip = 187
	" "
	printCode
		buffer = 0
		code = R
	"\"!!"
	keyWait
		any = false
	playerFinish
	playerResetObject
	clearMsg
	mugshotShow
		mugshot = MrProgBlue
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
	I THINK ONE IS IN
	THE COMP YOU'RE
	"""
	keyWait
		any = false
	clearMsg
	"""
	TAKEN TO IF YOU DO
	BAD THINGS!
	"""
	keyWait
		any = false
	flagSet
		flag = 493
	end
}
