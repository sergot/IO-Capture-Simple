module IO::Capture::Simple;

my $stdout = $*OUT;
my $stderr = $*ERR;

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
	my $result;

	my $*ERR = class {
		method print(*@args) {
			$result ~= @args.join;
		}
	}

	$code.();

	$result;
}

multi sub capture_stderr($target is rw) is export {
	$*ERR = class {
		method print(*@args) {
			$target ~= @args.join;
		}
	}
}

multi sub capture_stdin(Block $code) is export {
	...
}

sub capture_stdout_off is export {
	$*OUT = $stdout;
}

sub capture_stderr_off is export {
	$*ERR = $stderr;
}
