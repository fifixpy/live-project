<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发布抽奖</title>
    <link href="./demo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <section id="getintouch" class="rotateInUpLeft animated">
        <div class="container" style="border-bottom: 0;">
            <h1>
                <span>发布抽奖</span>
            </h1>
        </div>
        <div class="container">
            <form class="contact" action="./AddServlet" method="post" id="form">
            <div class="row clearfix">
                <div class="lbl">
                    <label for="fname">
                        关键字</label>
                </div>
                <div class="ctrl">
                    <input type="text" id="fname" name="fname" data-required="true" data-validation="text"
                        data-msg="Invalid word" placeholder="#我软工不挂科# #我软工高分过# #我很强#">
                </div>
            </div>
            <div>
                    <div class="lbl">
                            <label >
                                过滤规则</label>
                    </div>
                    <label>
                        <input type="radio" name="guolv" id="" class="a-radio" value="无过滤">
                        <span class="b-radio"></span>无过滤
                    </label>
                
                    <label>
                        <input type="radio" name="guolv" id="" class="a-radio" value="普通过滤">
                        <span class="b-radio"></span>普通过滤
                    </label>
                
                    <label>
                        <input type="radio" name="guolv" id="" class="a-radio" value="深度过滤">
                        <span class="b-radio"></span>深度过滤
                    </label>
                </div>
            <div class="row clearfix">
                <div class="lbl">
                    <label for="start_time">
                       抽奖开始时间</label>
                </div>
                <div class="ctrl">
                    <input type="text" id="start_time" name="start_time" data-required="true" data-validation="email"
                        data-msg="Invalid time" placeholder="Ex: 2020-12-28 16:00:00">
                </div>
            </div>

            <div class="row clearfix">
                <div class="lbl">
                    <label for="end_time">
                        抽奖结束时间</label>
                </div>
                <div class="ctrl">
                    <input type="text" id="end_time" name="end_time" data-required="true" data-validation="custom"
                        data-msg="Invalid time #" placeholder="Ex: 2020-12-28 16:00:00">
                </div>
            </div>
            <div class="row clearfix">
                    <div class="lbl">
                        <label for="kaijiang">
                            开奖时间</label>
                    </div>
                    <div class="ctrl">
                        <input type="text" name="kaijiang" id="kaijiang" placeholder="Ex: 2020-12-28 16:00:00">
                    </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">
                    <label for="prize">
                        奖品</label>
                </div>
                <div class="ctrl">
                    <input type="text" name="prize" id="prize" placeholder="Ex: mate20;iphone;小米5">
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">
                    <label for="subject">
                        抽奖人数</label>
                </div>
                <div class="ctrl">
                    <input type="text" name="subject" id="subject" placeholder="Ex: 108">
                </div>
            </div>
            <div class="row  clearfix">
                <div class="span10 offset2">
                    <input type="submit" name="submit" id="submit" class="submit" value="发布抽奖">
                </div>
            </div>
            </form>
        </div>
    </section>
</body>
</html>

