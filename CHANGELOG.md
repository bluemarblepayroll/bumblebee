# 3.1.1 (February 10th, 2020)

Fixes:

* Headers that contained a period broke due to cleanup performed in 3.1.0 (replaced internal attribute resolution with Objectable.)

# 3.1.0 (December 26th, 2019)

Additions/Changes:

* Added `Template#generate` option `bom` which will include the UTF-8 byte order mark.
* Ensured `Template#parse` ignores UTF-8 byte order marks, if one is present.

Internal:

* Cleaned up release process (added Rake)
* Removed internal attribute value resolution and replaced with [Objectable](https://github.com/bluemarblepayroll/objectable/tree/master/lib/objectable)
* Updated development dependencies

# 3.0.1 (March 14th, 2019)

* Add support for the following column syntax: ```column 'ID #', :id```, ```column = { 'ID #' => :id }```.  If the second argument is not a hash, it will be converted to: ```{ property: value }```
* pluck_join fix to correctly use ObjectInterface when extracting values.

# 3.0.0 (March 7th, 2019)

**Breaking Changes: Public API Re-Write**

* Major lessons were learnt during the implementation of versions one and two.  Version three seeks to iron out the DSL to make it more intuitive and usable.  Therefore, the entire DSL has been re-written from the ground up with a whole new API.

# 2.1.0 (March 4th, 2019)

* Added two domain-specific language options for configuring Column objects through Template: subclass Template class or pass in block.  This is optional and is backwards compatible.

# 2.0.1 (February 5th, 2019)

* Updated acts_as_hashable Dependency

# 2.0.0 (January 31, 2019)

* Upgraded Rubocop
* Updated README
* Hooked up CodeClimate / Test Coverage
* Changed internal implementation of Column#csv_to_object.  This is a breaking change that reverse's the flow of assignment: When a column is parsed and value is extracted, it will iterate over the to_object values one by one, chaining the previous value with the next.  Once it is complete, it assigns the value to the field.

# 1.2.1 (January 22, 2019)

* README enhancements.

# 1.2.0 (January 22, 2019)

* Updated parser so it is position-agnostic.  Previously the position of the headers mattered to the parser.  Now, the headers in the file will be used and matched on with the column headers.

# 1.1.0 (January 22, 2019)

* Updated parser so it is now compatible and works with Ruby 2.5.3 and 2.6.0.
* Minimum Ruby version bumped to 2.3.8

# 1.0.0 (December 27, 2018)

Initial Release
