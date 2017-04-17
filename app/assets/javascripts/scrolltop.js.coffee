ready = ->
  $(window).scroll ->
    element = $('#page-top-btn')
    visible = element.is(':visible')
    height=$(window).scrollTop()
    #▲表示のBreakPointを変数化し、基本値400pxをセット
    set_height = 400
    #URLよりページを取得 blogsの場合は200pxに
    if location.pathname.indexOf('blogs') != -1
      set_height = 200
      #alert(set_height) 確認用
    if height > set_height
      element.fadeIn() if !visible
    else
      element.fadeOut()
  $(document).on 'click','#move-page-top', ->
    $('html,body').animate({ scrollTop:0 },'slow')
  
$(document).ready(ready)
$(document).on('page:load', ready)