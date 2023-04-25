local exe6 = chaudloader.exedat.open("exe6.dat")
local exe6f = chaudloader.exedat.open("exe6f.dat")

function import_msg (mpak, addr, msg_file)
	old_msg = chaudloader.msg.unpack(mpak[addr])
	new_msg = chaudloader.msg.unpack(chaudloader.modfiles.read_file(msg_file))

	chaudloader.util.merge_msg(old_msg, new_msg)
	
	mpak[addr] = chaudloader.msg.pack(old_msg)
end

chaudloader.util.edit_mpak(exe6, "exe6/data/msg/message_eng", function(mpak)
	import_msg(mpak, 0x087AD8BC, "msg/virus_battler_v1.msg")
	import_msg(mpak, 0x087B0900, "msg/virus_battler_v2.msg")
	import_msg(mpak, 0x087B0554, "msg/virus_battler_v3.msg")
	import_msg(mpak, 0x087B1FF4, "msg/virus_battler_v4.msg")
	import_msg(mpak, 0x08799230, "msg/virus_battler_v5.msg")
end)
chaudloader.util.edit_mpak(exe6f, "exe6f/data/msg/message_eng", function(mpak)
	import_msg(mpak, 0x087AF988, "msg/virus_battler_v1.msg")
	import_msg(mpak, 0x087B29CC, "msg/virus_battler_v2.msg")
	import_msg(mpak, 0x087B2620, "msg/virus_battler_v3.msg")
	import_msg(mpak, 0x087B40C0, "msg/virus_battler_v4.msg")
	import_msg(mpak, 0x0879B2FC, "msg/virus_battler_v5.msg")
end)
