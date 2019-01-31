
$(document).ready(function (){
    $('.listContainer').height($(window).height()+50);
    $('#note').elastic();
    
});
$(document).ready(function (){
  $('#output_button').click(function() {
        var text = $('.code_box').val();
        $('#output_box').html(text);
    });  
});
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}
 