function gotoTop() {
    var targetOffset = $('body').offset().top;
    $('html,body').animate({scrollTop: targetOffset}, 1000);
    return false;
}

$(document).ready(function() {
    $("#btn-signup").tooltip({placement: 'right', title: 'Signup, track your progress, take quizzes.'});
    $('.carousel').carousel();

    $('.to-top').click(gotoTop);
});
