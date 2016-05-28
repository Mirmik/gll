#!/usr/bin/lua

dofile("./mk/llib/tableops.lua")
dofile("./mk/llib/pathops.lua")
dofile("./mk/llib/glmach.lua")

paths.mkdir("build");
paths.mkdir_list_relative({"main", "lib"}, "build");

local glltable = paths.find("*.gll","./")
print(table.tostring(glltable))
for i = 1, #glltable do
	glmach.dofile(glltable[i])
end  


glmach.print_modnames()

glmach.print_implementations("diag")

--table.save(glmach.mtable.modules, ".moduletable")
--tbl2 = table.load(".moduletable")
--print(table.tostring(paths.split("/lalala/jjj/k")))
--print(paths.reduce("/../jjj/k"))

--print(paths.reduce("fsdfak/gregwerg"))

--print(table.tostring(paths.split("lalala/jjj/k/")))
--print(table.tostring(paths.split("lalala/jjj/k/l.cpp")))
--print(paths.relative("lalala/jjj/k/", "lalala/jjj/k/l.cpp"))

--glmach.mod_print("main")