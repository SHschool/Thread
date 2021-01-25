<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <!DOCTYPE html>

    <html lang="ja">

    <head>
        <meta charset="UTF-8">
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
                    <!-- 右寄せ用 -->
                    <div class="col-1"></div>
                    <!-- アイコン群 -->
                    <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block">
                        <div class="row d-flex flex-column align-items-center">
                            <a href="index.jsp"><i class="fab fa-twitter fa-fw fa-3x my-4" style="color:cornflowerblue"></i></a>
                            <a href="index.jsp"><i class="fas fa-home fa-fw fa-2x my-3" style="color: cornflowerblue;"></i></a>
                            <i class="fas fa-hashtag fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <i class="far fa-bell fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <i class="far fa-envelope fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <a href="regist.jsp"><i class="far fa-user fa-fw fa-2x my-3" style="color: cornflowerblue;"></i></a>
                        </div>
                    </div>

                    <!-- center -->
                    <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                        <div class="row">
                            <div class="col-12 bg-white border border-top-0">
                                <p class="h2 my-3 ml-1">登録画面</p>
                            </div>
                        </div>

                        <!-- 投稿部分 -->
                        <div class="row border border-top-0">
                            <!-- tweet -->
                            <div class="col-xl-12 col-lg-10 col-md-10 col-sm-10 col-9">
                                <!-- form部分 -->
                                <form method="" action="regist">
                                    <div class="form-group row mt-4">
                                        <p class="col-sm-2 text-center mt-4 h4">ID</p>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control form-control-lg mt-3">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <p class="col-sm-2 mt-4 h4 text-center">NAME</p>
                                        <div class="col-sm-10">
                                            <input type="text" name="id" class="form-control form-control-lg mt-3">
                                        </div>
                                    </div>
                                    <div class="text-right mt-4">
                                        <button class="btn btn-primary btn-lg my-3 rounded-pill" type="submit"><span>登録する</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>

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