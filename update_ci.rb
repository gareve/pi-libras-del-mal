def main
   output = `svn update`

   vc = output.split("\n")

   if vc.size == 1
      puts '###### No changes! #######'
      return
   end

   vc.each do |line|
      puts line.strip
   end

   puts '###### Updated! #######'

end

main()