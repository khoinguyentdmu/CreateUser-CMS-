<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebApplication1.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <style>
        .card {
            margin: auto;
            float: none;
            margin-top: 0.5em;
            margin-bottom: 10px;
            border-width: 5px;
        }

        .btn-reg {
            margin: auto;
            float: none;
            margin-top: 2em;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 0.5rem;
        }

        label {
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <nav class="navbar navbar-dark bg-dark">
                    <a class="navbar-brand" href="#">Đăng ký tài khoản</a>
                </nav>

                <div class="card text-center">
                    <div class="card-header">
                        Tạo tài khoản để mỗi ngày code nhiều hơn!!!
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="card" style="width: 40rem;">
                                <div class="card-body">
                                    <h5 class="card-title">Hoàn thành các mục dưới đây để tiến hành tạo tài khoản</h5>
                                    <div class="row">
                                        <asp:Label ID="lblNotifycation" runat="server" BackColor="Red" Font-Size="Large"></asp:Label>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Họ và tên đệm <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" placeholder="Nhập họ và tên đệm"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Tên của bạn <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="Nhập tên"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Tên tài khoản <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Nhập tên tài khoản"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Email <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Nhập email"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Mật khẩu <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Nhập mật khẩu" type="password"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <div class="form-group">
                                                <label>Nhập lại mật khẩu <font color="red">(*)</font></label>
                                                <asp:TextBox ID="txtRePassword" runat="server" class="form-control" placeholder="Nhập lại mật khẩu" type="password"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="btn-reg">
                                            <asp:Button ID="btnReg" runat="server" Text="Đăng ký" class="btn btn-primary" OnClick="btnReg_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                        Bản quyền thuộc về Open IT Lab
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
