#!/usr/bin/perl -w 
use strict;

sub is_pandigital{   #do the three numbers x,y,z use all digits 1-9?
   my ($x, $y, $z) = @_;
   my %h;
   foreach(split("", "$x$y$z")){ #get rid of duplicate numbers
      $h{$_} = 1;
   }
   my @l = sort keys %h;
   # only uses all 9 if there are 9 unique digits, and when sorted, 
   # they begin and end with 1 and 9 resepctively
   return (scalar(@l) == 9 and $l[0] eq "1" and $l[-1] eq "9");
}

my $sum = 0;
for my $prod (1000..9999){
   INNER: for my $div (1..$prod-1){
      if($prod % $div == 0){
         my $pd = $prod / $div;
         if(&is_pandigital($prod, $div, $pd)){
            print "found one: $div $pd $prod\n";
            $sum += $prod;
            last INNER;
         }
      }
   }
}
print "$sum\n";
