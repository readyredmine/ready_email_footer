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
# run by: `rake redmine:plugins:test:units NAME=ready_email_footer`

class ReadyFooterTest < ActiveSupport::TestCase
  fixtures :users

  def current_user
    @current_user
  end

  def setup
    @current_user = users(:users_001)
  end

  def test_placeholders_are_defined
    assert ReadyFooter.placeholders.length > 8
  end
  
end