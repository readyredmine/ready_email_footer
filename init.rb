# This file is a part of ready_email_footer Redmine plugin.

# Copyright (c) 2022 ReadyRedmine (https://readyredmine.com)

# ready_email_footer is free software: you can redistribute it 
# and/or modify it under the terms of the GNU General Public License 
# as published by the Free Software Foundation, either version 3 
# of the License, or (at your option) any later version.

# ready_email_footer is distributed in the hope that it will 
# be useful, but WITHOUT ANY WARRANTY; without even the implied 
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <https://www.gnu.org/licenses/>.

require 'redmine'

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib/ready_email_footer"
require 'view_hooks'

Redmine::Plugin.register :ready_email_footer do
  name 'Ready Email Footer'
  author 'Ready Redmine'
  description 'A Redmine plugin to automatically generate email footer for each redmine user'
  version '0.5.0'
  url 'https://readyredmine.com'
  author_url 'https://readyredmine.com'
  requires_redmine :version_or_higher => '5.0.0'
  settings :default => {
    'ready_footer' => false,
    'ready_footer_body' => 'Best regards,<br>{first_name} {last_name}',
    'ready_footer_roles' => [],
    'ready_footer_groups' => []
  }, :partial => 'ready_email_footer_settings'
end
