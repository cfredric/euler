#!/usr/bin/perl -w
use strict;

sub check{  # is the sum of the fifth powers of the digits equal to the number itself?
   my $num = shift;
   my @digits = split "", $num;
   return &sum(@digits) == $num;   
}

sub sum{ #compute the sum of (digits^5)
   my @digits = @_;
   my $sum = 0;
   foreach (@digits){
      $sum += $_**5;
   }
   return $sum;
}

my $sum = 0;
my $last = 0;
foreach (2..200000){
   if (&check($_)){
      $sum += $_;
      $last = $_;
   }
}
print "$sum\n";
print "last = $last\n";
