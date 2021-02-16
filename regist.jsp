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
            <title>Document</title>
        </head>

        <body>
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-3"></div>
                        <div class="col-xl-6 col-12">
                            <div class="text-center">
                                <i class="fab fa-twitter fa-fw fa-3x mt-4 my-3" style="color: cornflowerblue;"></i>
                            </div>
                            <p class="h3 mt-3 text-center font-weight-bold">アカウントを作成</p>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <!-- form -->
                                    <form method="POST" action="regist" class="needs-validation" novalidate>
                                        <!-- name row -->
                                        <div class="row form-group my-4">
                                            <div class="input-group input-group-lg my-4">
                                                <!-- <p class="col-xl-2 col-lg-2 col-md-2 col-sm-3 col-12 h4 my-3 text-center ">ID</p> -->
                                                <div class="col-xl-12 col-lg-10 col-md-10 col-sm-9 col-12">
                                                    <input type="text" name="name" class="form-control form-control-lg mt-2" placeholder="名前を入力してください" pattern="\S+" required>
                                                    <!-- formが空だった時に表示される文章 -->
                                                    <div class="invalid-feedback"> 名前が入力されていません</div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- password row -->
                                        <div class="row form-group my-4">
                                            <!-- <p class="col-xl-2 col-lg-2 col-md-2 col-sm-3 col-12 h4 my-3 text-center">PASSWORD</p> -->
                                            <div class="col-xl-12 col-lg-10 col-md-10 col-sm-9 col-12">
                                                <input type="password" name="pass" class="form-control form-control-lg mt-2" placeholder="パスワードを入力して下さい" pattern="\S+" required>
                                                <!-- formが空だった時に表示される文章 -->
                                                <div class="invalid-feedback">パスワードが入力されていません</div>
                                            </div>
                                        </div>
                                        <!-- button -->
                                        <div class="text-right mt-4">
                                            <button class="btn btn-outline-primary btn-lg btn-block mt-5 mb-4 rounded-pill" type="submit"><span>登録する</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3"></div>
                    </div>
                </div>
            </main>

            <footer class="fixed-bottom d-block d-sm-none">
                <div class="col-12">
                    <div class="row flex-row-reverse" style="margin-right: 18px;">
                        <a href="" class="btn btn-primary btn-lg rounded-circle shadow mb-3" role="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="color: white;">+</a>
                    </div>
                </div>
                <div class="container border-top bg-white">
                    <div class="row">
                        <div class="col-12 d-flex flex-row">
                            <div class="col-3 my-3">
                                <a href="thread" id="#top" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="thread" style="color: gray"><i class="fas fa-search fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-user fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-envelope fa-fw fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

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