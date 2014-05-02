Package.describe({
	summary: 'famous wrapper utilities'
});

Package.on_use(function(api) {
	'use strict';

    api.use(['coffeescript', 'famono']);
	api.add_files([ 'famlib-exports.coffee' ], 'client');
	api.export(['getFamLib'], 'client');
});