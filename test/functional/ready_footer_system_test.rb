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

require "application_system_test_case"
# run by: `rake redmine:plugins:test:functionals NAME=ready_email_footer`

class ReadyFooterSystemTest < ApplicationSystemTestCase

  def test_templates_publicly_available
    visit '/footer/templates/1'
    assert_text "{name}"
  end

  def test_admin_can_manage_plugin
    log_user('admin', 'admin')
    visit '/settings/plugin/ready_email_footer'
    assert_selector "h2", text: "Ready Email Footer"
  end

  def test_download_denied
    log_user('jsmith', 'jsmith')
    visit '/footer/download'
    response = Net::HTTP.get_response(URI.parse(current_url))
    assert response.code.to_i.eql?(404)
  end

end


