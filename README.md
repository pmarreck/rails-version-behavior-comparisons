# Example output from the same test across Rails 3.0 through 3.2: #

## Rails 3.0: ##

	Finished in 0.20958s
	28 tests, 28 assertions, 14 failures, 0 errors, 0 skips

	Error / Failed Tests Summary
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 (failure) PersonTest - test: existing person with existing games counting via 'count' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: existing person with existing games counting via 'length' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: existing person with existing games counting via 'length' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: existing person with new games counting via 'count' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: existing person with new games counting via 'length' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: existing person with new games counting via 'length' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: existing person without games counting via 'count' should associate addition to in-memory game collection using 'build'.
	 (failure) PersonTest - test: existing person without games counting via 'count' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: existing person without games counting via 'count' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: existing person without games counting via 'length' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: existing person without games counting via 'length' should associate addition to saved game collection using 'new'.
	 (failure) PersonTest - test: new person without games counting via 'count' should associate addition to in-memory game collection using 'build'.
	 (failure) PersonTest - test: new person without games counting via 'count' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: new person without games counting via 'length' should associate addition to in-memory game collection using 'new'.

## Rails 3.1/3.2: ##

	Finished in 0.30963s
	28 tests, 28 assertions, 4 failures, 0 errors, 0 skips

	Error / Failed Tests Summary
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 (failure) PersonTest - test: existing person without games counting via 'count' should associate addition to in-memory game collection using 'build'.
	 (failure) PersonTest - test: existing person without games counting via 'count' should associate addition to in-memory game collection using 'new'.
	 (failure) PersonTest - test: new person without games counting via 'count' should associate addition to in-memory game collection using 'build'.
	 (failure) PersonTest - test: new person without games counting via 'count' should associate addition to in-memory game collection using 'new'.
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
