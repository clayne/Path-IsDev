
use strict;
use warnings;

package Path::IsDev::NegativeHeuristic::IsDev::IgnoreFile;

# ABSTRACT: An explicit exclusion file heuristic

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"Path::IsDev::NegativeHeuristic::IsDev::IgnoreFile",
    "interface":"single_class",
    "does":"Path::IsDev::Role::NegativeHeuristic::AnyFile"
}

=end MetaPOD::JSON

=head1 SYNOPSIS

In a C<::HeuristicSet>:

    sub negative_heuristics { return 'IsDev::IgnoreFile' }

Then on your file system:

    touch .path_isdev_ignore

Then the given location will no longer be a possible candidate for being deemed a C<dev> root directory.

However:

=over 4

=item * Its parents can still be deemed C<dev> directories

=item * Its children can still be deemed C<dev> directories

=back

=cut

use Role::Tiny::With;
with 'Path::IsDev::Role::NegativeHeuristic::AnyFile';

=method C<excludes_files>

Files valid for triggering this heuristic:

    .path_isdev_ignore

=cut

sub excludes_files {
  return ('.path_isdev_ignore');
}
1;
