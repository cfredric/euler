#!/usr/bin/perl -w
use strict;

#read numbers
open NUMS, "<nums.txt" or die "couldn't open nums.txt\n";
my @table;
while(my $t = <NUMS>){
   chomp $t;
   my @tmp = split " ", $t;
   push @table, \@tmp;
}

my $prod = 0;
my $elts = 4;
for my $y (0..@table-1){
   my $s = scalar(@{$table[$y]});
   for my $x (0..$s-1){
      if($x + $elts < $s){
         #not on the right edge: check rightward
         my $p = 1;
         $p *= ${$table[$y]}[$x];
         $p *= ${$table[$y]}[$x+1];
         $p *= ${$table[$y]}[$x+2];
         $p *= ${$table[$y]}[$x+3];
         $prod = $p if $p > $prod;
      }
      if($y + $elts < @table){
         #not on bottom: check downward
         my $p = 1;
         $p *= ${$table[$y]}[$x];
         $p *= ${$table[$y+1]}[$x];
         $p *= ${$table[$y+2]}[$x];
         $p *= ${$table[$y+3]}[$x];
         $prod = $p if $p > $prod;
      }
      if($y + $elts < @table and $x + $elts < $s){
         #not on bottom or right side: check diagonal (down-right)
         my $p = 1;
         $p *= ${$table[$y]}[$x];
         $p *= ${$table[$y+1]}[$x+1];
         $p *= ${$table[$y+2]}[$x+2];
         $p *= ${$table[$y+3]}[$x+3];
         $prod = $p if $p > $prod;
      }
      if($y >= $elts-1 and $x + $elts < $s){
         #not on top or right side: check diagonal (up-right)
         my $p = 1;
         $p *= ${$table[$y]}[$x];
         $p *= ${$table[$y-1]}[$x+1];
         $p *= ${$table[$y-2]}[$x+2];
         $p *= ${$table[$y-3]}[$x+3];
         $prod = $p if $p > $prod;
      }
   }
}

print "product = $prod\n";
