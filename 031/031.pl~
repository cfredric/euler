#!/usr/bin/perl -w


my $total = 200;  #find ways of making 200 pence
my @coins = (1, 2, 5, 10, 20, 50, 100, 200);
my %table;
print &calc($total, @coins) . "\n";

sub calc{
   #take in the list of unused coins so far, and a value to make out of them
   #return the number of ways that's possible
   my ($val, @coins) = @_;

   if(defined($table{"$val: @coins"})){
      return $table{"$val: @coins"};
   }

   #base cases
   return 0 if $val < 0;   #impossible to make negative money
   return 1 if $val == 0;  #only one way to make 0 pence
   
   #only one coin in the list
   if(scalar(@coins == 1)){
      return 1 if int($val/$coins[0]) == $val/$coins[0];
      return 0;
   }

   #otherwise, deal with the rest of the coins
   my $count = 0;
   for my $n (0..int($val/$coins[0])){
      #take $n of coin0, and make the rest of value with the other coins
      $count += &calc($val-$n*$coins[0], @coins[1..scalar(@coins)-1]);
   }

   #add to table
   $table{"$val: @coins"} = $count;
   return $count;
}
