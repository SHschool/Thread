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
            <title>�z�[�� / Twitter</title>
        </head>

        <body>
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <!-- �E�񂹗p -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block" id="top">
                            <div class="row d-flex flex-column align-items-center sticky-top">
                                <a href="thread#top" style="color: cornflowerblue;"><i class="fab fa-twitter fa-fw fa-3x mt-3 my-3"></i></a>
                                <a href="thread#top" data-toggle="tooltip" data-placement="left" title="�z�[���ɖ߂�" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-2x my-3"></i></a>
                                <a href="logout" data-toggle="tooltip" data-placement="left" title="���O�A�E�g" style="color: black;"><i class="fas fa-sign-out-alt fa-fw fa-2x my-3"></i></a>
                                <a href="" class="btn btn-primary rounded-circle shadow my-3" role="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="color: white;"><i class="far fa-edit fa-fw py-2" data-toggle="tooltip" data-placement="left" title="�c�C�[�g����"></i></a>
                                <a href="#top" class="my-2"><i class="far fa-arrow-alt-circle-up   fa-fw fa-3x" style="color: black;"></i></a>
                                <a href="#bottom" class="my-2"><i class="far fa-arrow-alt-circle-down fa-fw fa-3x" style="color: black;"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-6 col-lg-9 col-md-9 col-sm-10 col-12">
                            <div class="row sticky-top" id="top">
                                <div class="col-12 bg-white border border-top-0">
                                    <p class="h3 my-3 ml-1 font-weight-bold"><a href="thread#top" style="text-decoration: none; color: black;">�z�[��</a> </p>
                                </div>
                            </div>

                            <!-- ���e -->
                            <div class="collapse" id="collapseExample">
                                <div class="row border border-top-0">
                                    <!-- icon -->
                                    <div class="col-xl-1 col-lg-3 col-md-2 col-sm-2 col-3">
                                        <i class="far fa-user-circle fa-4x my-4"></i>
                                    </div>
                                    <!-- form -->
                                    <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9">
                                        <form method="POST" action="thread" class="userInfo">
                                            <div class="form-group">
                                                <input type="text" name="name" value="${targetName}" class="form-control form-control-lg mt-3" placeholder="���O" pattern="\S+" maxlength="10" required hidden>
                                                <div class="input-group input-group-lg mt-4">
                                                    <textarea name="content" id="textarea" class="form-control form-control-lg " placeholder="���܂ǂ����Ă�H ���S�p280�����܂�" maxlength="280" required></textarea>
                                                </div>
                                                <input type="text" name="tag" class="form-control form-control-lg mt-3" placeholder="�^�O����͂��ĉ�����" pattern="\S+" maxlength="30">
                                            </div>
                                            <div class="text-right">
                                                <button type="submit" class="btn btn-primary btn-lg my-3 mb-2 rounded-pill font-weight-bold"><span>�c�C�[�g����</span></button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- form�����܂� -->
                                </div>
                            </div>
                            <!-- ���e -->

                            <!-- tweet -->
                            <c:forEach var="thread" items="${threads}">
                                <div class="row border border-top-0">
                                    <!-- face icon -->
                                    <div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="far fa-user-circle fa-4x"></i>
                                    </div>

                                    <div class="col-xl-11 col-lg-11 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${thread.user_name}" /></span>
                                        <span class="h6 ml-3" style="color: gray;"><c:out value="${thread.date}" /></span>
                                        <p class="h4 my-3" style="white-space: pre-wrap;"><c:out value="${thread.content}" /></p>
                                        <p class="h4 my-3"><c:out value="${thread.tag}" /></p>
                                        <!-- icons -->
                                        <div class="row">
                                            <!-- reply button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="res?threadid=${thread.thread_id}" data-toggle="tooltip" data-placement="left" title="�ԐM" style="color:gray;" ><i class="far fa-comment fa-fw fa-lg mt-3 mb-4"></i></a>
                                            </div>
                                            <!-- likes button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="like?threadid=${thread.thread_id}" class="mt-2" data-toggle="tooltip" data-placement="top" title="������"><i class="far fa-heart fa-fw fa-lg mt-3 mb-4" style="color: red;"><span class="ml-2" style="color: black; font-size: 21px;">${thread.likes}</span></i></a>
                                            </div>
                                            <!-- delete button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="delete?threadid=${thread.thread_id}" class="mt-2" data-toggle="tooltip" data-placement="right" title="�c�C�[�g���폜"><i class="far fa-trash-alt fa-fw fa-lg mt-3 mb-4" style="color: gray;"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- tweet -->
                        </div>

                        <!-- center�����܂� -->

                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
                            <!-- �����t�H�[�� -->
                            <div class="sticky-top bg-white">
                                <div class="col-12">
                                    <div class="row">
                                        <form method="POST" action="search" class="ml-4 mt-2 w-100" id="search-form" name="search-form" >
                                            <div class="form-group row">
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-secondary bg-white mr-1" type="submit" id="button-addon1" style="border: none;"><i class="fas fa-search fa-fw fa-1x" style="color: cornflowerblue;"></i></button>
                                                </div>
                                                <input type="text" name="tag" class="form-control form-control-lg w-100 col-10 py-4" maxlength="30" placeholder="�^�O����" aria-label="text with button addon" aria-describedby="button-addon1" pattern="\S+"  style="border-radius: 100px; background-color: #EBEEF0;"  required>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- �����t�H�[�� -->

                            <!-- login user -->
                            <div class="sticky-top">
                                <div class="col-11 mt-3 ml-4 login-user-top bg-light">
                                    <div class="row mx-auto">
                                        <p class="h3 font-weight-bold pt-3 py-2 pl-2">���݂̃��[�U�[</p>
                                    </div>
                                </div>
                                <div class="col-11 ml-4 login-user-bottom bg-light">
                                    <div class="row mx-auto">
                                        <p class="h3 p-5"></p>
                                    </div>
                                </div>
                            </div>
                            <!-- login user -->
                        </div>
                    </div>
                </div>
            </main>

            <!-- ���Ɉړ��p -->
            <footer id="bottom"></footer>

            <!-- �X�}�z�p -->
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

            <script>
                // �e�L�X�g�G���A�ŋ󔒂Ɖ��s�������M���u���b�N
                $('.userInfo').on('submit', function (evt) {
                    if (!$('#textarea').val().match(/[^\s]+/)) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }
                });
                // �����p
                function check() {
                    var a = document.search_form.q.value;
                    if (a == "") {
                        return false;
                    } else if (!a.match(/\S/g)) {
                        return false;
                    }
                }
                // �e�L�X�g�G���A�̍�����������
                $("textarea").attr("rows", 2).on("input", e => {
                    $(e.target).height(0).innerHeight(e.target.scrollHeight);
                });
                // �X�N���[���p
                const smoothScrollTrigger = document.querySelectorAll('a[href^="#"]');
                for (let i = 0; i < smoothScrollTrigger.length; i++) {
                    smoothScrollTrigger[i].addEventListener('click', (e) => {
                        e.preventDefault();
                        let href = smoothScrollTrigger[i].getAttribute('href');
                        let targetElement = document.getElementById(href.replace('#', ''));
                        const rect = targetElement.getBoundingClientRect().top;
                        const offset = window.pageYOffset;
                        const gap = 60;
                        const target = rect + offset - gap;
                        window.scrollTo({
                            top: target,
                            behavior: 'smooth',
                        });
                    });
                }
                // �����˂����Ƃ��Ɉʒu��ێ�������
                $(window).scroll(function () {
                    sessionStorage.scrollTop = $(this).scrollTop();
                });
                $(document).ready(function () {
                    if (sessionStorage.scrollTop != "undefined") {
                        $(window).scrollTop(sessionStorage.scrollTop);
                    }
                });
                // �c�[���`�b�v�p
                $('[data-toggle="tooltip"]').tooltip();
            </script>
        </body>

        </html>