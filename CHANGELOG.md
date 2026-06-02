# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-06-02

### Changed
- **BREAKING**: Updated minimum Ruby version requirement to 4.0.0
- **BREAKING**: Updated minimum Rails version requirement to 7.0.0
- Migrated from Travis CI to GitHub Actions for continuous integration
- Updated test suite to be compatible with Rails 7.x and 8.x
- Updated dummy application configuration for modern Rails
- Changed gem source from http to https in Gemfile
- Added support for Rails 7.0, 7.1, and 8.0
- Added support for Ruby 4.0.5
- Updated `.ruby-version` to 4.0.5
- Replaced `sass-rails` development dependency with `sprockets-rails`
- Added conditional Sprockets registration for better compatibility

### Added
- GitHub Actions CI workflow for testing multiple Ruby and Rails versions
- CHANGELOG.md to track version changes

## [0.2.1] - Previous Release

Previous releases were compatible with:
- Ruby 1.8.7 - 2.1.0
- Rails 3.1.0 - 4.0.0

See git history for details on earlier changes.
