-- Compile only. Do not call the function returned by loadfile.
for path in io.lines() do
 local fn, err = loadfile(path)
 if fn then
  io.write('OK\t', path, '\n')
 else
  io.write('FAIL\t', path, '\t', tostring(err):gsub('\n', ' '), '\n')
 end
end
