<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<link type="text/css" href="css/download/download.css" rel="stylesheet"/>

<div class="banner">
    <div class="app_title">
        <h3><s:property value="%{getText('control.room.ggw.remote.eye')}"/></h3>
        <img src="images/download/remote_eye.png"/>
    </div>

    <div class="desc">
        <p><s:property value="%{getText('download.version')}"/>1.0 &nbsp;&nbsp;&nbsp;<s:property value="%{getText('download.size')}"/>9.2MB</p>
        <p><s:property value="%{getText('download.publish.time')}"/>11/2/2012</p>
        <p><s:property value="%{getText('download.sys.require')}"/>Android2.2+</p>
        <p><s:property value="%{getText('android.download.time')}"/>：<s:property value="downloadTime.downloadTimes"/></p>
    </div>
    <div class="android"></div>

    <div class="android"></div>

    <div class="download">
        <a href="javascript:startDownload();" title="<s:property value="%{getText('local.download')}"/>">
            <img src="images/download/local_download.png"/>
            <span><s:property value="%{getText('local.download')}"/></span>
        </a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:goToGooglePlay();" title="<s:property value="%{getText('google.play')}"/>">
            <img src="images/download/googleplay_download.png"/>
            <span><s:property value="%{getText('google.play')}"/></span>
        </a>
    </div>
</div>

<div id="content">
    <div class="content_m">
        <div class="content_mm">
            <h2><s:property value="%{getText('eye.home.monitor')}"/></h2>
            <p><s:property value="%{getText('eye.home.monitor.care')}"/></p>
            <img src="images/download/img4.png" />
        </div>

        <img style="float:left;margin-right:60px;" src="images/download/line.png" />

        <div class="content_mm">
            <h2><s:property value="%{getText('eye.comp.monitor')}"/></h2>
            <p><s:property value="%{getText('eye.comp.monitor.improve')}"/></p>
            <img src="images/download/img5.png" />
        </div>

        <img style="float:left;margin-right:60px;"  src="images/download/line.png" />

        <div class="content_mm">
            <h2><s:property value="%{getText('eye.shop.monitor')}"/></h2>
            <p><s:property value="%{getText('eye.shop.monitor.out')}"/></p>
            <img src="images/download/img6.png" />
        </div>

        <div style="clear:both"></div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $(".menu_base_download").addClass("menu_base_current");
    });

    function startDownload(){
        $.post("addDownloadTime.html");
        window.location.href = "software/RemoteEyes.apk";
    }
    function goToGooglePlay(){
        $.post("addDownloadTime.html");
        var url = "https://play.google.com/store/apps/details?id=air.GoGoWiseMonitor";
        goUrl(url);
    }
</script>

