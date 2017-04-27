# Change Log

## [Unreleased]

### Added
* POST `/survivors/{id}/report` to report a infected survivor.
* PUT `/survivors/{id}` endpoint to update a Survivor's location.
* POST `/survivors` endpoint to register a Survivor.
* Inventory model that represents a survivor inventory.
* Survivor model that represents a infected or non-infected person.
* Stack model that represents a stack of items.
* Item model that represents an item.
* Use [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers) for model serialization into JSON.
* Use [Factory Girl](https://github.com/thoughtbot/factory_girl_rails) as a fixture replacement.
* Use [RSpec](http://rspec.info/) for unit testing.
* Init project using [Rails 5.0](http://guides.rubyonrails.org/5_0_release_notes.html).

[Unreleased]: https://github.com/JayBIOS/zssn/commits/master
