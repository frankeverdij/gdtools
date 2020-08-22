function read_file_into_array(file, array ,status, record, count ) {
   count  = 0;
   while (1) {
      status = getline record < file
      if (status == -1) {
         print "Failed to read file " file;
         exit 1;
      }
      if (status == 0) break;
      array[++count] = substr(record,2,length(record)-1);
   }
   close(file);
   return count
}
BEGIN {
   pwd = ENVIRON["PWD"];
   mips3dir=substr(pwd,2,length(pwd)-1) "/mips3";
   substitutions = 0;
   records_count = read_file_into_array("mips3/mipslist", File);
}
{
   s=""
   if ( (index($0,"f") == 1) && (match($0,"CPUARCH=") == 0) ) {
      for (i in File) {
         if ($6 == File[i]) {
            substitutions++;
            print $0" mach(CPUARCH=R5000 CPUARCH=R8000 CPUARCH=R10000)";
            sub("usr/nekoware",mips3dir,$6);
            s = " mach(CPUARCH=R4000)";
         }
      }
   }
   print $0 s
}
