Ready Email Footer
============

Ready Email Footer plugin is brought to you by ReadyRedmine (https://readyredmine.com).

The plugin allows configuring a uniform email footer for Redmine users. Using this plugin you may efficiently distribute a unified email footer through your organization. Redmine users may download an HTML file (on `My account page`) and use it with desired email client software.

You can learn more about this plugin here: https://readyredmine.com/ready-email-footer-redmine-plugin/

Requirements
------------

- Redmine `= 5.0.0`


Installation
------------

- Clone this repository into `redmine/plugins/ready_email_footer`
- Restart your Redmine web server (e.g. unicorn)


Usage
-------

1) As an Administrator:
- go to `Administration -> Plugins -> Ready Email Footer (Configure)`
- design your footer using a preview window and available placeholders
- go to `Administration -> Custom Fields` and add custom fields to User if you want additional placeholders (ie. department, telephone). New placeholders will appear in the Ready Email Footer plugin configuration.
- remember to select `Enable footer download`, `Enable for roles`, `Enable for groups` in plugin configuration for certain users to have email footer available for download

2) As a User assigned to a role or group that has an email footer enabled
- go to `My account` and fill any defined additional fields (ie. department, telephone)
- use 'show' and 'download' links to view and download personalized footer


License
-------

This plugin is licensed under the terms of GNU/GPL v3+.
See LICENSE for details.
