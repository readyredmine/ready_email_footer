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

class ReadyFooterController < ApplicationController

  before_action :set_user,        only: [:preview, :download, :show]
  before_action :ensure_enabled,  only: [:download, :show]
  before_action :ensure_admin,    only: [:preview]

  def show
    render html: ReadyFooter.footer.html_safe
  end

  def download
    send_data ReadyFooter.footer.html_safe, 
      filename: @user.firstname.strip << "_" << @user.lastname.strip << ".html"
  end

  def preview
    render html: ReadyFooter.footer(params[:template]).html_safe
  end

  def template
    render partial: 'ready_footer_template' << params[:id]
  end

  private

    def set_user
      @user = User.current
    end

    def ensure_enabled
      render_404 unless ReadyFooter.enabled?
    end

    def ensure_admin
      render_403 unless @user.admin
    end

end
