$(function () {

    /*$(".textboxregister").on({
        focus: function () {
            $(this).parent().find("i").addClass('imagefocused');
        },

        blur: function () {
            $(this).parent().find("i").removeClass('imagefocused');
        }
    });*/

    $(".textboxregister").focus(function () {
        $(this).parent().find("i").addClass('imagefocused');
    })

    $(".textboxregister").blur(function () {
        $(this).parent().find("i").removeClass('imagefocused');
    })


    /*$('#TextBoxusername').on({
        focus: function () {
            $('.img-1').addClass('imagefocused');
        },

        blur: function () {
            $('.img-1').removeClass('imagefocused');
        }
    });*/

    $("#CheckBoxShowPwd").change(function () {
        var checked = this.checked;
        $("#TextBoxPassword").attr('type', function () {
            return checked ? "text" : "password";
        })
    });

    $(".close").click(function () {
        $(".blocker").hide();
    });
    
})