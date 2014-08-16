#! /usr/bin/perl

my $dev = 2.1;
my $dis = 5.39e3;

my @c = (65, 70, 75, 80, 85, 90, 95);
my $f = 34;
my $distance = 3.35;

foreach $cad (@c) {
    push (@cadence, sprintf("%5d",$cad));
}
print "              Cadence (rpm)\n";
print "n  @cadence\n";

my @cog_teeth = ( 15, 16, 17, 19, 21, 23, 25, 27);
my @chainring_teeth = ( 34, 39, 49, 53 );

foreach $n ( 15, 16, 17, 19, 21, 23, 25, 27) {
  @out = ();
  @speed = ();
  foreach $c ( @c ) {
    $t = $dis * $n / ($dev * $c * $f);
    my $min = int $t;
    my $sec = ($t - $min) * 60;
    #push (@out, sprintf("%5.2f",$t));
    push (@out, sprintf("%2d:%02d",$min,$sec));
    $s = ($distance * 60) / $t;
    push (@speed, sprintf("%5.2f",$s));
  }
  push (@out," time");
  push (@speed," avg mph");

  print "$n @out\n";
  print "   @speed\n\n";
}

print "\n";
print "Assumes front chainring with $f teeth\nn = cog size\n";
print "Output is time in min:sec & speed in mph.\n\n";


$t = shift || 20.0;
my $min = int $t;
my $sec = ($t - $min) * 60;

print "\n\nFor target time " . sprintf("%2d:%02d",$min,$sec) . "\n";

foreach my $crt (@chainring_teeth) { push (@crt, sprintf("%5d",$crt));
    } print " Chainring (teeth)\n"; print "n @crt\n";

foreach $n (@cog_teeth) {
  @out = ();
  @speed = ();
  foreach $f ( @chainring_teeth ) {
    $c = $dis * $n / ($dev * $t * $f);
    $s = ($distance * 60) / $t;
    push (@out,   sprintf("%5d",int $c));
    push (@speed, sprintf("%5.2f",$s));
  }
  push (@out," cadence");
  push (@speed," avg mph");

  print "$n @out\n";
  print "   @speed\n\n";
}


