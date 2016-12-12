# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@cloneElement = (subject, target) ->
  clone = $(subject).clone()
  console.log(clone);
  console.log('11');
  showSetNameAndId(clone.children().children().children('textarea'), plusOne(bottomId(target)))
  clone.attr("class", "")
  clone.append(target)
  return clone

@bottomId = (selector) ->
  bottomId = /\d+$/.exec($(selector).children().children().children('textarea').last().attr("id"))
  if bottomId
    return parseInt(bottomId)
  return 0

#// <textarea name="card[list_items][0]" id="list_item_0"></textarea>

@showSetNameAndId = (selector, new_id) ->
#  selector = $(selector)
  name = selector.attr("name").replace(/(\d+)\]$/, new_id)
  id   = selector.attr("id").replace(/(\d+)$/, new_id)
  selector.attr("name", name)
  selector.attr("id", id)
  return

@populateListItem = (text) ->
  cloneElement(".clonee", ".list_items").children().children().children('textarea').val(text)
  return

plusOne = (str) ->
  return (parseInt(str)+1).toString()