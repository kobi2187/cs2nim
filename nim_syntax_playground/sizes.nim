import system, os
# find /home/kobi7/More_CS_Libs_and_Apps/ -name *.csast -size -2M > sizes.txt

let file = os.commandLineParams()[0]
for f in file.lines:
  if f.fileExists:
    # let fh = open(f)
    let s = f.getFileSize
    echo $s & "::" & f
    # close(fh)
