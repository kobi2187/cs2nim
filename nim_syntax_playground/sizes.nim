# let file = "/home/kobi7/More_CS_Libs_and_Apps/csast_files"
let file = "/boot/efi/Downloads/CSharpSampleLibs/csast_files"
for f in file.lines:
  let fh = open(f)
  let s = fh.getFileSize
  echo $s & "::" & f
  close(fh)
