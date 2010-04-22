use ExtUtils::MakeMaker;
WriteMakefile(
		NAME         => 'Games::SGF::Go::Rotator',
		VERSION_FROM => 'lib/Games/SGF/Go/Rotator.pm',
		PREREQ_PM    => {
		  Games::SGF::Go => 0.992,
		  Games::SGF::Util => 0.992
		}
	     );
