<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="SJIS">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            <title>ログイン / Threader</title>
        </head>

        <body>
            <main>
                <div class="container">
                    <div class="row">
                        <!-- center -->
                        <div class="col-xl-8 col-12 mx-auto">
                            <!-- twitter icon -->
                            <div class="text-center">
                                <a href="thread" style="color: #e0193f;"><i class="fas fa-apple-alt fa-fw fa-4x mt-3 my-3"></i></a>
                            </div>

                            <p class="h3 my-2 text-center font-weight-bold">Threaderにログイン</p>

                            <!-- login form -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <!-- form -->
                                    <form method="POST" action="login" class="needs-validation" novalidate>
                                        <!-- name row -->
                                        <div class="row form-group mt-2 mb-4">
                                            <div class="input-group input-group-lg my-4">
                                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <input type="text" name="userName" class="form-control form-control-lg mt-2" placeholder="名前を入力してください" data-max-length="20" pattern="\S+" required>
                                                    <!-- formが空だった時に表示される文章 -->
                                                    <div class="invalid-feedback ml-3"> 名前が入力されていません</div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- password row -->
                                        <div class="row form-group my-4">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <input type="password" name="password" class="form-control form-control-lg mt-2" placeholder="パスワードを入力して下さい" data-max-length="10" pattern="\S+" required>
                                                <!-- formが空だった時に表示される文章 -->
                                                <div class="invalid-feedback ml-3">パスワードが入力されていません</div>
                                            </div>
                                        </div>
                                        <!-- button -->
                                        <div class="text-right mt-4">
                                            <button class="btn btn-outline-primary btn-lg btn-block mt-5 mb-4 rounded-pill" type="submit"><span>ログイン</span></button>
                                        </div>
                                    </form>
                                </div>
                                <!-- login form -->

                                <!-- account link -->
                                <div class="col-12 text-center">
                                    <a href="regi" class="mt-5 h5">アカウント作成</a>
                                </div>
                            </div>

                            <div>
                                <p class="col-12 text-center mt-3" style="color:red; font-size:25px;">${errorMess}</p>
                            </div>
                        </div>
                        <!-- center -->
                    </div>
                </div>
            </main>

            <script>
                (function () {
                    window.addEventListener('load', function () {
                        var forms = document.getElementsByClassName('needs-validation');
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();

                $(document).ready(function () {
                    $(document).on('change keyup focus', '[data-max-length]', function () {
                        var arr = $(this).val().split('');
                        var len = 0;
                        var maxlen = parseInt($(this).attr('data-max-length'));
                        var str = '';
                        for (i in arr) {
                            len += (escape(arr[i]).match(/%u..../) && !(arr[i]).match(/^[ｦ-ﾟ]$/)) ? 2 : 1;
                            if (len <= maxlen) {
                                str += arr[i];
                            }
                        }
                        $(this).val(str);
                        return;
                    });
                });
            </script>
        </body>

        </html>