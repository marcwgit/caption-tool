#!/usr/bin/perl

use strict;
use warnings;

print "hello \n";
my $basename = "cap_MonMar21_01_01PM-";
my @CATS;
my $filesnum = 5;


#first

for (my $filenum = $filesnum - 1; $filenum > 0; $filenum--) {

  my $timestring = "ffprobe -i " . $basename . $filenum .".m4a   -v quiet -show_format | sed -n 's/duration=//p'";
  my $time = `$timestring`;
  print "time is ",$time,"\n";
  my $arg1 = "-d " . $time;
  my $fileEndcapt = $basename . "5.srt";
  my $arg2 = "-i " . $fileEndcapt;
  my $arg3 = "-o out.srt";
  my $arg4 = 0;
  system ("srttool" , $arg1 , $arg2 , $arg3 );

  my $filelastcap =  $basename . $filenum . ".srt";
  my $arg5 = "combfile.srt";
  my $arg6 = "out.srt";
  my $arg7 = "cap_MonMar21_01_01PM-4.srt";

  #my @CATS = ($arg7, 'out.srt');
  $arg7 = $CATS[0]; $arg6 = $CATS[1];

  my ($arg7, $arg6) = @CATS;
  print $arg7; print $arg6;

  foreach my $n (@CATS) {
    say $n;
    print "CATS\n";
  }

  open SEL, '>', 'selected.srt' or die $!;
  FILE: foreach (@CATS) {

      open(FILE, $_) || ((warn "Can't open file $_\n"), next FILE);

      print "$_ \n";

        while (<FILE>) {
          print SEL;
        }
      close(FILE);

    }
   close(SEL);
}
#second
    $timestring = "ffprobe -i " . $basename . "3.m4a   -v quiet -show_format | sed -n 's/duration=//p'";
    $time = `$timestring`;
   print "time is ",$time,"\n";
    $arg1 = "-d " . $time;
    $fileEndcapt = "selected.srt";
    $arg2 = "-i " . $fileEndcapt;
    $arg3 = "-o out.srt";
    $arg4 = 0;
   system ("srttool" , $arg1 , $arg2 , $arg3 );

    $filelastcap =  $basename . "3.srt";
    $arg5 = "combfile.srt";
    $arg6 = "out.srt";
    $arg7 = "";

    @CATS = ('cap_MonMar21_01_01PM-3.srt', 'out.srt');

      open SEL, '>', 'selected.srt' or die $!;
      FILE: foreach (@CATS) {

         open(FILE, $_) || ((warn "Can't open file $_\n"), next FILE);

         print "$_ \n";

         while (<FILE>) {
            print SEL;
         }
         close(FILE);

      }
      close(SEL);

#third
       $timestring = "ffprobe -i " . $basename . "2.m4a   -v quiet -show_format | sed -n 's/duration=//p'";
       $time = `$timestring`;
      print "time is ",$time,"\n";
       $arg1 = "-d " . $time;
       $fileEndcapt = "selected.srt";
       $arg2 = "-i " . $fileEndcapt;
       $arg3 = "-o out.srt";
       $arg4 = 0;
      system ("srttool" , $arg1 , $arg2 , $arg3 );

       $filelastcap =  $basename . "2.srt";
       $arg5 = "combfile.srt";
       $arg6 = "out.srt";
       $arg7 = "";

       @CATS = ('cap_MonMar21_01_01PM-2.srt', 'out.srt');

        open SEL, '>', 'selected.srt' or die $!;
         FILE: foreach (@CATS) {

            open(FILE, $_) || ((warn "Can't open file $_\n"), next FILE);

            print "$_ \n";

            while (<FILE>) {
               print SEL;
            }
            close(FILE);

         }
         close(SEL);

#fourth
          $timestring = "ffprobe -i " . $basename . "1.m4a   -v quiet -show_format | sed -n 's/duration=//p'";
          $time = `$timestring`;
         print "time is ",$time,"\n";
          $arg1 = "-d " . $time;
          $fileEndcapt = "selected.srt";
          $arg2 = "-i " . $fileEndcapt;
          $arg3 = "-o out.srt";
          $arg4 = 0;
         system ("srttool" , $arg1 , $arg2 , $arg3 );

          $filelastcap =  $basename . "4.srt";
          $arg5 = "combfile.srt";
          $arg6 = "out.srt";
          $arg7 = "";

          @CATS = ('cap_MonMar21_01_01PM-1.srt', 'out.srt');

            open SEL, '>', 'selected.srt' or die $!;
            FILE: foreach (@CATS) {

               open(FILE, $_) || ((warn "Can't open file $_\n"), next FILE);

               print "$_ \n";

               while (<FILE>) {
                  print SEL;
               }
               close(FILE);

            }
            close(SEL);
