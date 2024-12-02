require 'html-proofer'

opts = {
  checks: ['Links', 'Scripts', 'Images'],
  disable_external: true,
  ignore_empty_alt: true,
  ignore_missing_alt: true,
  enforce_https: false
}

HTMLProofer.check_directory(ARGV[0], opts).run
