<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta charset="UTF-8">
        <title>Document</title>

        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <style>
            *{box-sizing: border-box;}
            
            .btn{
                background: #99cda9;
                border : none;
                color: darkslategray;
            }
            .btn:hover{
                background: #698474;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-0">
            <div class="row fixed-top align-items-center" id="top">
                <div class="col-2 text-center">
                    <label class="m-0 logo">Show Your Closet</label>
                </div>
                <div class="col-10">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">StyleBoard</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">StyleBoast</a>
                                <a class="dropdown-item" href="#">StyleHelp</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MyPage</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Info</a>
                                <a class="dropdown-item" href="#">Closet</a>
                                <a class="dropdown-item" href="#">Style</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Login</a>
                        </li>
                        <!-- 로그인 후 회원가입 및 마이페이지 메뉴 추가 생성 -->
                    </ul>
                </div>
            </div>
            <div class="row">
               <div class="col-12 mt-5"></div>
                <div class="col-12 mt-5" style="text-align: center;">
                    <h1>회원 가입</h1>
                    <hr class="mt-3">
                </div>
            </div>

            <div class="row"> 
                <div class="col-sm-8 col-md-8 col-lg-4 p-3" style="margin: auto; background: #e5e4cc"> 
                    <form action="${pageContext.request.contextPath}/member/signupProc">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="InputEmail">Email</label>
                                    <input type="email" name="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12"> 
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="InputPassword">Password</label>
                                            <input type="password" name="pw" class="form-control" id="InputPassword">
                                        </div>
                                        <div class="col-6">
                                            <label for="InputRePassword">Password Check</label>
                                            <input type="password" class="form-control" id="InputRePassword">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>    
                        <div class="row">
                            <div id="pwResult"><span></span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="InputName">Name</label>
                                    <input type="text" name="name" class="form-control" id="InputName">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">

                                    <label for="InputNickName">NickName</label>
                                    <div class="row">
                                        <div class="col-9">
                                            <input type="text" name="nickname" class="form-control" id="InputNickName">
                                        </div>
                                        <div class="col-3">
                                            <button type="button" class="btn btn-secondary" style="width: 100%;">중복확인</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="secondPhone">Phone</label>
                                    <div class="row">
                                        <div class="col-4">
                                            <select class="custom-select" name="phone1">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="019">031</option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" name="phone2" id="secondPhone" class="form-control" > </div>
                                        <div class="col-4">
                                            <input type="text" name="phone3" id="thirdPhone" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label> Gender</label>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="man" name="gender" value="M" class="custom-control-input">
                                        <label class="custom-control-label" for="man">남자</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="woman" name="gender" value="W" class="custom-control-input">
                                        <label class="custom-control-label" for="woman">여자</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 p-0">
                                <div class="form-group" style="text-align: center">

                                    <button type="submit" class="btn" style="width: 100%; height: 50px;">가입하기</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>
        <div class="row">
           <div class="col-12"><hr class="mb-3"></div>
            <div class="col-12" id="bottom">
                <div class="row">
                    <div class="col-2" id="bottom-logo">
                        Show Your Closet
                    </div>
                    <div class="col-10 align-self-center" id="bottom-contents">
                        <div class="row">
                            서울 중구 남대문로 120 대일빌딩 3층 F Class (주) In Sync
                        </div>
                        <div class="row">
                            Copyright © 2020 InSync Inc. 모든 권리 보유.
                        </div>
                        <div class="row">
                            대표전화&nbsp;&#124;&nbsp;010-8854-8699&nbsp;&#124;&nbsp;010-8077-1131
                        </div>
                        <div class="row">
                            <a href="#">개인정보 처리방침</a>&nbsp;&#124;&nbsp;
                            <a href="#">약관</a>&nbsp;&#124;&nbsp;
                            <a href="#">법적 고지</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>