use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Games::SGF::Go::Rotator',
    META_MERGE => {
        license => 'other',
        resource => {
	    repository => 'https://github.com/DrHyde/perl-modules-Games-SGF-Go-Rotator'
        }
    },
    VERSION_FROM => 'lib/Games/SGF/Go/Rotator.pm',
    PREREQ_PM    => {
      Games::SGF::Go => 0.993,
      Games::SGF::Util => 0.993
    },
    EXE_FILES => [qw(
      bin/sgfrotate
    )],
);
