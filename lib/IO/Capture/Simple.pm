module IO::Capture::Simple;

my $stdout = $*OUT;
my $stderr = $*ERR;
my $stdin = $*IN;

multi sub capture(Callable $code) is export {
	...
}

multi sub capture_stdout(Callable $code) is export {
	my $result;

	my $*OUT = class {
		method print(*@args) {
			$result ~= @args.join;
		}
	}

	$code.();

	$result;
}

multi sub capture_stdout_on($target is rw) is export {
	$*OUT = class {
		method print(*@args) {
			$target ~= @args.join;
		}
	}
}

multi sub capture_stderr(Callable $code) is export {
	my $result;

	my $*ERR = class {
		method print(*@args) {
			$result ~= @args.join;
		}
	}

	$code.();

	$result;
}

multi sub capture_stderr_on($target is rw) is export {
	$*ERR = class {
		method print(*@args) {
			$target ~= @args.join;
		}
	}
}

multi sub capture_stdin(Callable $code) is export {
	...
}

multi sub capture_stdin($target) is export {
	...
}

sub capture_stdout_off is export {
	$*OUT = $stdout;
}

sub capture_stderr_off is export {
	$*ERR = $stderr;
}

sub capture_stdin_off is export {
	$*IN = $stdin;
}
