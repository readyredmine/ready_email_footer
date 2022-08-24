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

require File.expand_path('../../test_helper', __FILE__)
# run by: `rake redmine:plugins:test:integration NAME=ready_email_footer`

class ReadyFooterIntegrationTest < Redmine::IntegrationTest
  fixtures :all

  def test_admin_should_see_preview
    log_user('admin', 'admin')
    post('/footer/preview', params: {template: '<html>{name}</html>'})
	  assert_response :success
  end

  def test_user_should_not_see_preview
    log_user('jsmith', 'jsmith')
    post('/footer/preview', params: {template: '<html>{name}</html>'})
    assert_response 403
  end

end
