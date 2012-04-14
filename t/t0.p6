use IO::Capture::Simple;
use Test;
plan 2;

my $test = "OH HAI!";

my $r = capture_stdout { print $test }

ok $r ~~ $test;

$r = '';

capture_stdout($r);
print $test;
stdout_off;
ok $r ~~ $test;
