<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>

    <html lang="ja">

    <head>
        <meta charset="SJIS">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title>アカウントを登録する / Twitter</title>
    </head>

    <body>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-12 mx-auto">
                        <!-- twitter icon -->
                        <div class="text-center">
                            <i class="fab fa-twitter fa-fw fa-3x mt-4 my-3" style="color: cornflowerblue;"></i>
                        </div>

                        <p class="h3 my-2 text-center font-weight-bold">アカウントを作成</p>

                        <!-- regist form -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <form method="POST" action="regist" class="needs-validation" novalidate>
                                    <!-- name row -->
                                    <div class="row form-group mt-2 mb-4">
                                        <div class="input-group input-group-lg my-4">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <input type="text" name="userName" class="form-control form-control-lg mt-2" placeholder="名前を入力してください" pattern="\S+" required>
                                                <!-- formが空だった時に表示される文章 -->
                                                <div class="invalid-feedback ml-3"> 名前が入力されていません</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- password row -->
                                    <div class="row form-group my-4">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <input type="password" name="password" class="form-control form-control-lg mt-2" placeholder="パスワードを入力して下さい" pattern="\S+" required>
                                            <!-- formが空だった時に表示される文章 -->
                                            <div class="invalid-feedback ml-3">パスワードが入力されていません</div>
                                        </div>
                                    </div>
                                    <!-- button -->
                                    <div class="text-right mt-4">
                                        <button class="btn btn-outline-primary btn-lg btn-block mt-5 mb-4 rounded-pill" type="submit"><span>登録する</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- regist form -->
                    </div>
                </div>
            </div>
        </main>
        
        <!-- 文字が打ち込まれていないときに使われるやつ -->
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
        </script>

    </body>

    </html>