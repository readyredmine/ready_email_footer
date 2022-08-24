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

scope '/footer' do
	get  '/show', 			to: 'ready_footer#show',   		as: :footer_show
	post '/preview', 		to: 'ready_footer#preview',   	as: :footer_preview
	get  '/templates/:id', 	to: 'ready_footer#template',   	as: :footer_template
	get  '/download', 		to: 'ready_footer#download',   	as: :footer_download
end