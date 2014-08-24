function gotoTop() {
    var targetOffset = $('body').offset().top;
    $('html,body').animate({scrollTop: targetOffset}, 1000);
    return false;
}

$(document).ready(function() {
    $("#btn-signup").tooltip({placement: 'right', title: 'Signup, track your progress, take quizzes.'});
    $('.carousel').carousel();

    $('.to-top').click(gotoTop);

    $.fn.editable.defaults.mode = 'inline';
    $('#first_name').editable();
    $('#last_name').editable();
    $('#short_bio').editable();
    $('#bio').editable();
    $('#website').editable();
});
