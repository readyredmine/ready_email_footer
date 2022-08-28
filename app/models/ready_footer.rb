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

class ReadyFooter < ActiveRecord::Base

  class << self
    def placeholders
      {
        'login'         => login,
        'name'          => name,
        'first_name'    => firstname,
        'last_name'     => lastname,
        'email'         => email,
        'time_zone'     => time_zone,
        'language'      => language,
        'highest_role'  => highest_role,
        'roles'         => roles
      }.merge(custom)
    end

    def footer(s = nil)
      s = Setting.plugin_ready_email_footer['ready_footer_body'] if s.blank?
      placeholders.each do |k,v|
        s = s.gsub "{#{k}}", v.to_s
      end
      s
    end

    def enabled?
      Setting.plugin_ready_email_footer['ready_footer'] == '1' &&
        (role_priviledge? || group_priviledge?)
    end
  end


  private 

    class << self
      def role_priviledge?
        (Setting.plugin_ready_email_footer['ready_footer_roles']&User
          .current.roles.map{|role| role.id.to_s}).present?
      end

      def group_priviledge?
        (Setting.plugin_ready_email_footer['ready_footer_groups']&User
          .current.groups.map{|group| group.id.to_s}).present?
      end

      def user
        User.current
      end

      def login
        user.login&.strip
      end

      def name
        user.name&.strip
      end

      def firstname
        user.firstname&.strip
      end

      def lastname
        user.lastname&.strip
      end

      def email
        user.mail&.strip
      end

      def time_zone
        user.time_zone.to_s.strip
      end

      def language
        languages_options.select{|code| code.second == user.language.to_s }
          .map{|name| name.first}.first.to_s.strip
      end

      def highest_role
        user.roles.all.order(position: :asc).first&.name.to_s.strip
      end

      def roles
        user.roles.all.order(position: :asc).map{|role| role.name.strip}
          .reject(&:blank?).join(',') 
      end

      def custom
        CustomValue.includes(:custom_field).where(
          custom_field: {type: 'UserCustomField'},
          customized_type: 'Principal', 
          customized_id: user.id) 
        .map{|custom| {custom.custom_field.name => custom.value.strip}}.reduce({}, :merge)
      end
    end
end
