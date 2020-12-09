require 'html-proofer'

opts = {
  check_external_hash: true,
  allow_hash_href: true,
  disable_external: true,
  empty_alt_ignore: true,
  only_4xx: true,
  verbose: true
}

HTMLProofer.check_directory(ARGV[0], opts).run
