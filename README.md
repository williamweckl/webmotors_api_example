# Webmotors Brands and Models search APP

This application was developed for a job test to work in [ADTsys](http://www.adtsys.com.br/).

Given an example APP, the proposal was to refactor it, changing what I thought was necessary or to leave it more organized.

The APP goal is to list vehicle brands and their models according to the WebMotors API.

## What was done

- Updated rails to the last stable version
- Changed the name of model `make` to the more appropriate name `brand`.
- Models associations and tests with `rspec` and `shoulda-matchers`
- Added `webmotors_id` to model too, to identify if it has been saved or not when get from the API
- Does not make sense to get from WebMotors API every request since we have this data in the database. So, I created a rake task to populate the brands getting data from the API
- To create models I've created a rake task too. Just don't forget to run the task to populate brands first!
- Moved the Brand model call to the controller where it belongs (was in view)
- Moved the Model model call to the controller where it belongs, setting the brand according to the brand id and not the WebMotors brand id that was used before
- Refactored the form in the home view to use rails helpers
- Refactored route to use root and models view to use root_path with link_to
- Controllers tests
- Removed unused gems like `jquery-rails`

## Populating brands

To populate brands just run the command: `rake brands:populate`. That's it!

Probably this command should be runned periodically, this task will probably be in some tasks scheduler.

Takes about 1 second to run.

## Populating models

To populate models just run the command: `rake models:populate`. That's it!

Probably this command should be runned periodically after populating brands.

Takes about 1 minute to run.

## Final considerations

Thank you for the challenge.