use v6;
use IO::Capture::Simple;

my $result;
capture_stdout($result);

print "OH ";
say "HAI!";

stdout_off;

print "RESULT: $result";
