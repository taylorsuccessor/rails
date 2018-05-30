App.car = App.cable.subscriptions.create "CarChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    data = JSON.parse(data.message)
    console.log(data);
    template=' <tr class="odd"> <td>' + data['id'] + '</td><td>' + data['name'] + '</td><td>' + data['user_text'] + '</td>
               <td><div class="tableActionsMenuDiv"><div class="innerContainer"><i class="fa fa-list menuIconList"></i>
               <button type="submit" name="Delete" class="deleteRow" > <i class="fa fa-trash"></i> </button>
               <a href="<%= edit_car_path(I18n.locale,oResult.id) %>" class="fa fa-edit"></a>
                <a href="<%= car_path(I18n.locale,oResult.id) %>"  class="fa fa-file-text"></a>
                </div> </div> </td> </tr>';

    $('#main_car_table tbody').prepend(template);
    # Called when there's incoming data on the websocket for this channel
