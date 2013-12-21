# Test

minitest-handler is not picking up my tests, location issue?

`tests/default/*_test.rb`

# TravisCI reverse-engineering

travis-ci/travis-hub Search there how they use the worker
~/clones/travis-core/lib/travis/model/build.rb
~/clones/travis-core/lib/travis/model/request.rb
~/clones/travis-core/lib/travis/model/request/approval.rb
~/clones/travis-core/lib/travis/model/job/queue.rb
~/clones/travis-worker/lib/travis/worker/factory.rb
~/clones/travis-worker/spec/instance_spec.rb
~/clones/travis-worker/lib/travis/worker/cli/development.rb
~/clones/travis-worker/lib/travis/worker/instance.rb
~/clones/travis-worker/lib/travis/worker/job/runner.rb
~/clones/travis-worker/play/vbox.rb
~/clones/travis-worker/lib/travis/worker/application.rb

And the Build Lifecycle
http://about.travis-ci.org/docs/user/build-configuration/#Build-Lifecycle

# Ideas and TODOs about this project

## Add support about Machine Configuration to .travis.yml
https://circleci.com/docs/configuration#machine

## To achieve as close as possible TravisCI environment, i may need to check these:
https://github.com/travis-ci/travis-cookbooks/tree/master/ci_environment
http://about.travis-ci.org/fr/docs/user/ci-environment/

## Analyze plugins usage
This plugin adds support for ANSI escape sequences, including color, to Console Output.
https://wiki.jenkins-ci.org/display/JENKINS/AnsiColor+Plugin

This plugin allows booting of Vagrant virtual machines, provisioning them and also executing scripts inside of them
https://wiki.jenkins-ci.org/display/JENKINS/Vagrant+Plugin

This plugin allows you to configure every aspect of email notifications
https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin

## Add PhantomJS and YSlow to the CI pipeline
http://yslow.org/phantomjs/#screenshots-jenkins

## Add more tests
