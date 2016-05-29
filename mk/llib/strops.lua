
function string.split(inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={} ; i=1
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      t[i] = str
      i = i + 1
   end
   return t
end

function  string.tblgsub(str,ptbl,ntbl)
	assert( #ptbl == #ntbl )
	local lstr = str
	for i = 1, #ptbl do
		lstr = string.gsub(lstr, ptbl[i], ntbl[i])
	end
	return lstr
end