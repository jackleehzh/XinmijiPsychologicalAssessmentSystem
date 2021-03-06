<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>Layui-Test</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/layui-v2.5.6/layui/css/layui.css">
    <style>
        html,body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #login-panel {
            background-color: aliceblue;
            width: 400px;
            height: 300px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div style="position: fixed; opacity: 0.3; width: 100%; height: 100%; left: 0; top: 0; z-index: -3;">
    <img style="height: 100%; width: 100%; position: fixed; object-fit: cover;" src="/static/pic/神乐七奈背景图.jpg">
</div>
<div class="layui-container">
    <div id="login-panel" class="layui-container layui-card">
        <div class="layui-card-header">
            注册
        </div>
        <form class="layui-form layui-card-body"
              lay-filter="form-register">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text"
                           name="username"
                           lay-verify="not_empty"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password"
                           id="psw-twice"
                           name="password"
                           lay-verify="not_empty"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-block">
                    <input type="password"
                           lay-verify="psw_verify"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit"
                            lay-filter="btn-register"
                            lay-submit=""
                            class="layui-btn">
                        注册
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/static/jquery-3.4.1/dist/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="/static/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(["form"], function () {
        layui.form.verify({
            not_empty: function (value) {
                if(value.length == 0) {
                    return "此处不应为空";
                }
            },
            psw_verify: function (value) {
                if($("#psw-twice").val() != value) {
                    return "确认密码不一致";
                }
            }
        });
        layui.form.on("submit(btn-register)", function (data) {
            // layer.alert(JSON.stringify(data.field));
            $.post('/api/register', {
                name: data.field.username,
                psw: data.field.password
            }, function (data) {
                if(data.length == 0) {
                    layer.alert('注册成功', function () {
                        window.location.href = '/page/login';
                    });
                } else {
                    layer.alert(data);
                }
            });
            return false;
        })
    });
</script>
</body>
</html>
