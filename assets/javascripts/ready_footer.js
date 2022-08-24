/**
 * This file is a part of ready_email_footer Redmine plugin.
 * 
 * Copyright (c) 2022 ReadyRedmine (https://readyredmine.com)
 * 
 * ready_email_footer is free software: you can redistribute it 
 * and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software Foundation, either version 3 
 * of the License, or (at your option) any later version.
 * 
 * ready_email_footer is distributed in the hope that it will 
 * be useful, but WITHOUT ANY WARRANTY; without even the implied 
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License 
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

$(document).ready(function(){

    preview();

    $('.load-template').click(function(){   
        load_data(this)
    });

    $("#edit-footer").bind('paste', function (){
        preview();
    });

    $("#edit-footer").keyup(delay(function () {
        preview();
    }, 500));

    function preview() {
        var html = $('#edit-footer').val();
        var prev = $("#preview-container");
        var link = prev.data("preview-path");
        $.post(link, { template: html })
          .done(function( data ) {
            prev.contents().find('body').html(data);
        });
    }

    function load_data(template){
        var template_path = $(template).data("template-path")
        $.get(template_path, function(content) {
            $("#edit-footer").text(content);
        })
        .promise().done(function() {
            preview();
        });
    }

    function delay(callback, ms) {
        var timer = 0;
        return function() {
            var context = this, args = arguments;
            clearTimeout(timer);
            timer = setTimeout(function () {
                callback.apply(context, args);
            }, ms || 0);
        };
    }

});
