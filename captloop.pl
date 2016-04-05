#!/usr/bin/perl
#works
use strict;
use warnings;
use Data::Dumper qw(Dumper);

my ($basename, $filesnum) = @ARGV;
print Dumper \@ARGV;

print "hello \n";
#my $basename = "Tue-Mar-22-02-51PMGroupB";
my @CATS;
#my $filesnum = 3;
my $fileEndcapt = $basename . "-" . $filesnum . ".srt";


#first

for (my $filenum = $filesnum - 1; $filenum > 0; $filenum--) {

  my $timestring = "ffprobe -i " . $basename . "-" .  $filenum .".m4a   -v quiet -show_format | sed -n 's/duration=//p'";
  my $time = `$timestring`;
  print "time is ",$time,"\n";
  my $arg1 = "-d " . $time;

  my $arg2 = "-i " . $fileEndcapt;
  my $arg3 = "-o out.srt";
  my $arg4 = 0;
  system ("srttool" , $arg1 , $arg2 , $arg3 );
  print "srttool  $arg1  $arg2  $arg3 \n";

  my $filelastcap =  $basename .  "-" . $filenum . ".srt";
  my $arg5 = "combfile.srt";
  my $arg6 = "out.srt";
  my $arg7 =  $basename .  "-" . $filenum .".srt"; #"cap_MonMar21_01_01PM-4.srt"

  my @CATS = ($arg7, 'out.srt');
  # $arg7 = $CATS[0]; $arg6 = $CATS[1];

  # my ($arg7, $arg6) = @CATS;
  print $arg7; print $arg6;

  foreach my $n (@CATS) {
    #say $n;
    print "$n\n";
    print "CATS\n";
  }

  $fileEndcapt = $basename .  "-" . ".srt";

  open SEL, '>', $fileEndcapt or die $!;

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

my $arg11 = "-r";

#  my $arg21 = "-i capThuMar24_1258PM-.srt";
my $arg21 = "-i " . $basename .  "-" . ".srt";
  my $arg31 = "-o " . $basename .  ".srt";
#  my $arg31 = "-o capThuMar24_1258PM.srt";
  print "srttool  $arg11  $arg21  $arg31 \n";

  my $renum = "srttool -r -i ". $basename . "-.srt -o " . $basename . ".srt";
  print $renum;

#system ("srttool",$arg11, $arg21,$arg31 );

system($renum);

##open TOMS, '>', $basename .  ".srt" or die $!;
#open(FILE, $basename .  ".srt")
#perl -i.bak -pe 's/\n/\r\n/' <TOMS>;
close(TOMS);


=begin
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
            =cut
