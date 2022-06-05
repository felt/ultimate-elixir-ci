# The Ultimate Elixir CI

[![ExUnit Tests](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-build-and-test.yml/badge.svg)](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-build-and-test.yml) [![Dialyzer](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-dialyzer.yml/badge.svg)](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-dialyzer.yml) [![Quality Checks](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-quality-checks.yml/badge.svg)](https://github.com/felt/ultimate-elixir-ci/actions/workflows/elixir-quality-checks.yml) [![Nightly Test](https://github.com/felt/ultimate-elixir-ci/actions/workflows/nightly-integration-test.yml/badge.svg)](https://github.com/felt/ultimate-elixir-ci/actions/workflows/nightly-integration-test.yml)

This is a base project for setting up a GitHub Actions-based Elixir
continuous integration (CI) system, as [described on our blog](https://felt.com/blog/hashrocket-ultimate-elixir-to-the-next-level).

It builds on [the Hashrocket post](https://hashrocket.com/blog/posts/build-the-ultimate-elixir-ci-with-github-actions)
on setting up the ultimate Elixir CI, with some important tweaks:

1. It runs most CI jobs in parallel so you get the fastest feedback
2. It runs all actions on every commit (the jobs never "fail fast"), so you'll know _all_ the things you need to fix on the first run
3. It pulls out a lot of boilerplate for setting up and caching the project into a shared "composite" action
4. It clears the build cache when a human asks for a retry, neatly resolving mistrust of build caches
5. It configures Dependabot to get PRs to update the dependencies
6. It runs slow tests in a nightly integration test job, rather than on every commit

The independent CI jobs it sets up are:

1. Test (via ExUnit)
2. Dialyzer
3. Formatting, checking for compile-time dependencies between modules, and Credo (these could be separate tasks, but in my experience they run fast enough even on large projects that it's not worth breaking them apart)

We cache as much as we can between the jobs. Thus, for instance, your first run of Dialyzer will be sloooooooow, but subsequent ones should be quite fast. Do note that running the tasks in parallel, rather than sequentially, means you're trading CI time for dev productivity. This is the right tradeoff for most teams, but your mileage may vary.

The important bits here for including in your project are:

- `.github/**/*`
- `.formatter.exs`
- `mix.exs`, or at least the dependencies, Dialyzer config, and ExCoveralls config there
- Optional: `.dialyzer_ignore.exs` (otherwise you'll need to remove that line from mix.exs)
