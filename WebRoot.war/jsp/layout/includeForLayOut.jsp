<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% request.setCharacterEncoding("UTF-8"); %>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%--<script type="text/javascript" src="js/keeperScript.js"></script>--%>
<%--<script type="text/javascript" src="js/ajaxReq.js"></script>--%>
<script type="text/javascript" language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="js/timezone.js"></script>
<script type="text/javascript" src="js/jquery.boxy.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<link type="text/css" href="css/boxy.css" rel="stylesheet"/>
<link href="css/global.css" type="text/css" rel="stylesheet" />
<script src="js/global.js" type="text/javascript"></script>
<!--[if lte IE 6]> <script type="text/javascript" src="js/iepngfix/iepngfix_tilebg.js"></script> <![endif]-->
<script type="text/javascript">
    var INTEGER_FORMAT_WRONG = "请输入有效的正整数";

    // ======================================create date pick
    var userNickname;
    var tipInterval = 0;

    function createDatePicker(ctlname) {
        var id = "#" + ctlname;
        var dateformate ="<s:text name='dateformat'/>";
        var laguage="<s:text name='language'/>";
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateformate,
                alwaysUseStartDate:true});
        });
    }
    function createDateTimePicker(ctlname) {
       var id = "#" + ctlname;
        var laguage="<s:text name='language'/>";
         var dateTimeformat="<s:text name='dateformat.forclass'/>";
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateTimeformat,
                alwaysUseStartDate:true});

        });
    }
    function createTimePicker(ctlname) {
//        alert(ctlname);
       var id = "#" + ctlname;
       var dateformate ="<s:text name='dateformat.hour.minute'/>";
       var laguage="<s:text name='language'/>";
//       alert($(id).parent().html());
       $(id).bind("click", function() {
            $("#" + ctlname).innerText=WdatePicker({lang:laguage,startDate:'%y-%M-%d 00:00:00',dateFmt:dateformate,
                alwaysUseStartDate:true});
        });
    }
    function testIEVersion(){
        var browser = navigator.appName;
        if (browser == "Microsoft Internet Explorer"){
            var b_version = navigator.appVersion.split(";")[1].replace(/ /g,"");
            if(b_version == "MSIE6.0") {
                Boxy.confirm("<s:text name='frame.browser.version.low'/>", null, {title: ''});
             }
        }
    }

    $(function(){
        if ($("input.Wdatepicker") != null && $("input.Wdatepicker") != undefined) {
            $("input.Wdatepicker").each(function() {
                createDatePicker(this.id);
            });
        }

        if ($("input.WdateTime") != null && $("input.WdateTime") != undefined) {
            $("input.WdateTime").each(function() {
                createDateTimePicker(this.id);
            });
        }

        if ($("input.WTime") != null && $("input.WTime") != undefined) {
            $("input.WTime").each(function() {
                createTimePicker(this.id);
            });
        }

        calculate_time_zone("<s:property value='#session.timeZone'/>");
//        testIEVersion();

        <%--<s:if test="#session.email !=null">--%>
            <%--userNickname="<s:property value="#session.nickName"/>";--%>
            <%--Keeper.addListener(userNickname+"notify",notify);--%>
        <%--</s:if>--%>
        <%--<s:else>--%>
            <%--userNickname = "annoy";--%>
        <%--</s:else>--%>

        $("#tip_msg_inner").hover(function(){
            if(tipInterval) window.clearInterval(tipInterval);
            $("#pop_live_message_tip").show();
        },function(){
            tipInterval = window.setTimeout(function(){$("#pop_live_message_tip").slideUp("slow");},5000);
        });
        $("#close_btn").click(function(){
            $("#pop_live_message_tip").slideUp("slow");
        });
    });

    function showOnliveMsg(hostNickName,hostPic,personalOnliveID,userMattersID){
        $("#userName_perHost").html(hostNickName);
        $("#user_pic").attr("src",hostPic);
        $("#linkAddress_perHost").attr('href','fansWatchPerOnliveControl.html?personalOnlive.id='+personalOnliveID+'&amp;userMatters.id='+userMattersID);
        $("#pop_live_message_tip").slideDown("slow");
    }

    function notify(obj){
        var str = obj.responseText;
        var strs = str.split("$");
        showOnliveMsg(strs[1],strs[2],strs[3],strs[4]);
    }

    function changeWordNumber(input_area, input_msg, TOTAL_WORDS_NUMBER) {
        var exist_words_number = getStrLength($(input_area).val());
        if (exist_words_number >= TOTAL_WORDS_NUMBER) {
            var partStr = getSubString($(input_area).val(), TOTAL_WORDS_NUMBER);
            $(input_area).val(partStr);
            exist_words_number = TOTAL_WORDS_NUMBER;
        }
        $(input_msg).html(exist_words_number + "/" + TOTAL_WORDS_NUMBER);
    }

    function checkInteger(textFieldId,tipMsgId){
        var number = document.getElementById(textFieldId).value;
        var numberPattern = /[1-9]\d*/;
        if(!numberPattern.test(number)){
            document.getElementById(tipMsgId).innerHTML = INTEGER_FORMAT_WRONG;
            return false;
        }
        return true;
    }

    function getStrLength(str) {
            var len = 0;
            for (var i = 0; i < str.length; i++) {
                var c = str.charCodeAt(i);
                if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
                    len++;
                } else {
                    len += 2;
                }
            }
            return len;
        }

    function getSubString(str,sLength){
        var len = 0;
        for (var i = 0; i < str.length; i++) {
            var c = str.charCodeAt(i);
            if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
                len++;
            }else {
                len += 2;
            }
             if(len > sLength){
                 return str.substring(0,i);
             }else if(len == sLength){
                 return str.substring(0,i+1);
             }
        }
        return str;
    }
    function becomeFans(obj,userID){
        if(validateLogo()){
           $.post("addUserFocus.html",{'user.id':userID},function(){});
           $(obj).html("<s:text name='user.add.focused'/>");
        }
    }
    function validateLogo(){
       if(document.getElementById('hidSessionId').value > 0) {
           return true;
       } else {
           $.fancybox({
                "type":"iframe",
                "href":"login.html",
                "width":350,
                "height":270
           });
           return false;
       }
    }
</script>


<%--<script type="text/javascript">--%>
    <%--var _gaq = _gaq || [];--%>
    <%--_gaq.push(['_setAccount', 'UA-26210233-1']);--%>
    <%--_gaq.push(['_trackPageview']);--%>

    <%--$(function() {--%>
        <%--var ga = document.createElement('script');--%>
        <%--ga.type = 'text/javascript';--%>
        <%--ga.async = true;--%>
        <%--ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';--%>
        <%--var s = document.getElementsByTagName('script')[0];--%>
        <%--s.parentNode.insertBefore(ga, s);--%>
    <%--});--%>
<%--</script>--%>

