#!/usr/bin/perl

use strict;
use warnings;

print "hello \n";
my $time = `ffprobe -i Amb-Tue-Mar15-09-43-AM_part3.m4a   -v quiet -show_format | sed -n 's/duration=//p'`;
print "time is ",$time,"\n";
my $arg1 = "-d " . $time;
my $fileEndcapt = "Amb-Tue-Mar15-09-43-AM_part4.srt";
my $arg2 = "-i " . $fileEndcapt;
my $arg3 = "-o out.srt";
my $arg4 = 0;
system ("srttool" , $arg1 , $arg2 , $arg3 );

my $filelastcap = "Amb-Tue-Mar15-09-43-AM_part3.srt";
my $arg5 = "combfile.srt";
my $arg6 = "out.srt";
my $arg7 = $filelastcap . " " . $arg6 . " > " . $arg5;

my @CATS = ('Amb-Tue-Mar15-09-43-AM_part3.srt', 'out.srt');
# for test my @CATS = ('Amb-Tue-Mar15-09-43-AM_part3.srt');
#my @CATS = (1);
#($filelastcap , $arg6) = @CATS;

=begin
#open SEL, '>', 'selected.txt' or die $!;

#while (<>) {
#  print SEL;
#}
=cut

#  PROGRAM: cat

#  for each arg, open the file and print it

   FILE: foreach (@CATS) {

      open(FILE, $_) || ((warn "Can't open file $_\n"), next FILE);
      open SEL, '>>', 'selected.txt' or die $!;
      print "$_ \n";

      while (<FILE>) {
         print SEL;
      }
      close(FILE);

   }
   close(SEL);

=begin
$time = `ffprobe -i Amb-Tue-Mar15-09-43-AM_part3.m4a   -v quiet -show_format | sed -n 's/duration=//p'`;
print "time is ",$time,"\n";
$arg1 = "-d " . $time;
$arg2 = "-i Amb-Tue-Mar15-09-43-AM_part4.srt";
$arg3 = "-o out.srt";
$arg4 = 0;
system ("srttool" , $arg1 , $arg2 , $arg3 );

$time = `ffprobe -i Amb-Tue-Mar15-09-43-AM_part3.m4a   -v quiet -show_format | sed -n 's/duration=//p'`;
print "time is ",$time,"\n";
$arg1 = "-d " . $time;
$arg2 = "-i Amb-Tue-Mar15-09-43-AM_part4.srt";
$arg3 = "-o out.srt";
$arg4 = 0;
system ("srttool" , $arg1 , $arg2 , $arg3 );
=cut
