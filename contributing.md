# Local Installation
- clone the repo
- `bundle install`
- `rake db:migrate`
- create a .env file in the root directory
- copy in the environment variables pinned in the `#taco-hack` channel into your .env file
- `rails s` to run the bot
- You can confirm the app is running by visiting `/` to see the taco

# Developing Locally
- While developing locally, please test your code in the `#slack-test` channel
- The production bot is @flombot
- The dev bot is @flombot-dev

# How to Contribute
- Issues are tracked [here](https://github.com/flatiron-school/flombot/projects/1)
- You are allowed to add issues, but if your issue is large in scope (a feature addition), please run it by the `#taco-hack` channel for approval
- You are allowed to assign yourself to unassigned issues
- A new code you should be attached to an issue

# Dev Workflow
- assign yourself to an issue, e.g. [issue 4](https://github.com/flatiron-school/flombot/issues/4)
- create a new branch to work on
- name the branch name with the issue number and a short description of the work, e.g. `4-channel-feedback`
- once you have started work, move the issue to `in progress`
- when your work is ready for review, make a pull request
- if you put `closes #4` in the body of your pull request, the issue will automatically close when the PR is merged
- assign reviewers or message `taco-hack` to get reviews
- you need two approvals before merging into master
- once you have merged to master, message `taco-hack` that your feature is ready to deploy
- move your issue to `done` once the feature is merged to master
