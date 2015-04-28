#!/usr/bin/perl -w
sub isPrime($){
    my $n = shift;
    return 0 if ($n % 2 == 0 and $n != 2);
    my $i = 3;
    while($i <= sqrt($n)){
        return 0 if($n % $i == 0);
        $i += 2;
    }
    return 1;
}
sub getRotations($){
    my $num = shift;
    my $l = length($num);
    my @list;
    for (1..$l){
        push(@list, $num);
        $num = rotate($num);
    }
    return @list;
}
sub rotate($){
    my $num = shift;
    my ($h, $t) = $num =~ m/^(\d)(\d*)$/;
    return $t . $h;
}
sub isCircularPrime($;$){
    my $num = $_[0];
    my $hr = $_[1];
    return $$hr{$num} if(defined($$hr{$num}));
    my $l = length($num);
    my $circularPrime = 1;
    my @list = getRotations($num);
    for my $n (@list){
        if(!isPrime($n)){
            $circularPrime = 0;
            last;
        }
    }
    if ($circularPrime){
        print "Found one! " . join(', ', @list) . "\n";
    }
    for my $n (@list){
        $$hr{$n} = $circularPrime; 
    }
    return $circularPrime;
}
my $sum = 0;
my %hash;
my $u = 1000000;
for(2..$u){
    $sum += isCircularPrime($_, \%hash);
}
print "Found $sum circular primes below $u.\n";
