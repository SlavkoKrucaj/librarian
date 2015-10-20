# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'librarian/version'

Gem::Specification.new do |s|
  s.name = 'librarian'
  s.authors = ['Slavko Krucaj', 'Michael England']
  s.email = %w(slavko.krucaj@gmail.com mg.england@gmail.com)
  s.summary = 'Leave me be'
  s.homepage = 'https://github.com/SlavkoKrucaj/librarian'
  s.version = Librarian::VERSION
  s.license = 'MIT'

  s.add_dependency 'thor', '~> 0.19'

  s.files = `git ls-files`.split($\)
  s.executables = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
end