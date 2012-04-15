use IO::Capture::Simple;
use Test;

plan 2;

my $test = "OH HAI!";

my $r = capture_stderr { note $test }

ok $r ~~ /$test/;

$r = '';

capture_stderr($r);
note $test;
capture_stderr_off;

ok $r ~~ /$test/;
