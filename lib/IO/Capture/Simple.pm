module IO::Capture::Simple;

my $stdout = $*OUT;

multi sub capture(Block $code) is export {
	...
}

multi sub capture_stdout(Block $code) is export {
	my $result;

	my $*OUT = class {
		method print(*@args) {
			$result ~= @args.join;
		}
	}

	$code.();

	$result;
}

multi sub capture_stdout($target is rw) {
	$*OUT = class {
		method print(*@args) {
			$target ~= @args.join;
		}
	}
}

multi sub capture_stderr(Block $code) is export {
	...
}

multi sub capture_stdin(Block $code) is export {
	...
}

sub stdout_off is export {
	$*OUT = $stdout;
}
