Package.describe({
  name: 'mrmasly:barcode',
  version: '0.0.1',
  summary: 'barcode for meteor',
  git: 'https://github.com/mrMasly/meteor-barcode',
  documentation: 'README.md'
});

Npm.depends({
  'lodash.debounce': '4.0.8'
});


Package.onUse(function(api) {
  api.versionsFrom('1.4.3.1');
  api.use('coffeescript@1.12.3_1');
  api.use('ecmascript@0.6.3');
  api.addFiles('src/client.coffee', 'client');
  api.addFiles('src/server.coffee', 'server');
});
