  $(document).ready(function () {
            $("#login-form").validate({
                rules: {
                    uname: {
                        required: true,
                        minlength: 5
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    answer: {
                        required: true,
                        minlength: 3
                    }
                },
                messages: {
                    uname: {
                        required: "Masukkan username",
                        minlength: "Gunakan minimal 5 huruf"
                    },
                    password: {
                        required: "Masukkan Password",
                        minlength: "Gunakan minimal 5 huruf"
                    },
                    answer: {
                        required: "Masukkan Jawaban Pertanyaaan Keamanan",
                        minlength: "Gunakan minimal 5 huruf"
                    }
                }
            });

});
