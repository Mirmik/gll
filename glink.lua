#!/usr/bin/lua

dofile("./mk/llib/tableops.lua")
dofile("./mk/llib/strops.lua")
dofile("./mk/llib/pathops.lua")
dofile("./mk/llib/glmach.lua")
dofile("./mk/llib/mkops.lua")
dofile("./mk/llib/colorizing.lua")

--print(string.tblgsub("piter parker",{"piter","parker"},{"tony","stark"}))

paths.mkdir("build")

Variables = {
	CC = "gcc",
	CXX = "g++",
	LD = "g++",
	AR = "ar",
	INCLUDE = "-I./src/include",
	DEFINE = "-DGENOS=1989",
	CCFLAG = "",
	CXXFLAG = "",
	LDFLAG = "",
}

RulePrototypes = {
	s_rule = "{CC} #src -c -o #tgt {INCLUDE} {DEFINE} {CCFLAG}",
	cc_rule = "{CC} #src -c -o #tgt {INCLUDE} {DEFINE} {CCFLAG}",
	cxx_rule = "{CXX} #src -c -o #tgt {INCLUDE} {DEFINE} {CXXFLAG}",
	ld_rule = "{LD} -o #tgt -Wl,--start-group #src -Wl,--end-group {LDFLAG}",
	ar_rule = "{AR} rc #tgt #src" 
}

rule = mk.rule_build(Variables, RulePrototypes.cxx_rule)
ldrule = mk.rule_build(Variables, RulePrototypes.ld_rule)

srclst = {"main.cpp", "list.cpp"}

sl, tl = mk.prepare_srctgt_lists(srclst,"o",".","build")
mk.use_rule_list(rule, sl, tl)

mk.use_rule_simple(ldrule, string.concat_from_list(tl, " "), "genos")