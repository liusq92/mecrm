<?php

header("Content-Type: text/plain; charset=utf-8");
// 输出为utf-8的文本格式，仅用于测试
//发送验证码
function kykSendSms($phone, $templateCode, $msg) {
	Vendor('SignatureHelper');

	$params = array();

	// *** 需用户填写部分 ***

	// fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
	$accessKeyId = "LTAI8XnRTPr3lQjF";
	$accessKeySecret = "KhZjRXOThQYU4NZNHq25v5CSU73apa";

	// fixme 必填: 短信接收号码
	$params["PhoneNumbers"] = $phone;

	// fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
	$params["SignName"] = "念柴";

	// fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
	$params["TemplateCode"] = $templateCode;

	// fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
	$params['TemplateParam'] = $msg;

	// fixme 可选: 设置发送短信流水号
	//	$params['OutId'] = "12345";

	// fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
	//	$params['SmsUpExtendCode'] = "1234567";

	// *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
	if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
		$params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
	}

	// 初始化SignatureHelper实例用于设置参数，签名以及发送请求
	$helper = new SignatureHelper();

	// 此处可能会抛出异常，注意catch
	$content = $helper -> request($accessKeyId, $accessKeySecret, "dysmsapi.aliyuncs.com", array_merge($params, 
		array("RegionId" => "cn-hangzhou", "Action" => "SendSms", "Version" => "2017-05-25", ))
	);

	return $content;

}

//格式化打印输出
function p($array) {
	dump($array, 1, '<pre>', 0);
}
/**
 * 获得随机字符串
 * @param $len             需要的长度
 * @param $special        是否需要特殊符号
 * @return string       返回随机字符串
 */
function getRandomStr($len, $special=true){
    $chars = array(
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
        "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
        "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
        "3", "4", "5", "6", "7", "8", "9"
    );

    if($special){
        $chars = array_merge($chars, array(
            "!", "@", "#", "$", "?", "|", "{", "/", ":", ";",
            "%", "^", "&", "*", "(", ")", "-", "_", "[", "]",
            "}", "<", ">", "~", "=", ","
        ));
    }

    $charsLen = count($chars) - 1;
    shuffle($chars);                            //打乱数组顺序
    $str = '';
    for($i=0; $i<$len; $i++){
        $str .= $chars[mt_rand(0, $charsLen)];    //随机取出一位
    }
    return $str;
}

//计算每月的天数
function getDay($year, $month) {
	if (strlen($month) == 1) {
		$month = '0' . $month;
	}
	switch($month) {
		case '01' :
		case '03' :
		case '05' :
		case '07' :
		case '08' :
		case '10' :
		case '12' :
			return '31';
			break;
		case '02' :
			if ($year % 400 == 0 || ($year % 100 != 0 && $year % 4 == 0)) {
				return '29';
			} else {
				return '28';
			}
			break;
		case '04' :
		case '06' :
		case '09' :
		case '11' :
			return '30';
			break;
		default :
			return '31';
			break;
	}
}

function getData($year, $month, $i, $flg) {
	$y = $year;
	$m = intval($month) + $i;

	$y = $y + intval($m / 12);
	$m = $m % 12;
	if ($m == 0) {
		$y = $y - 1;
		$m = 12;
	}
	if ($flg == 1) {
		return $y . '-' . $m . '-01';
	} else if ($flg == 0) {
		return $y . '-' . $m . '-31';
	} else {
		return $y . '-' . $m;
	}

}

function getYMD($y, $m, $d) {
	$d = intval($d);
	$m = intval($m);
	$day = getDay($y, $m);
	//	if($d > $day){
	//		$d = $d - $day;
	//		$m = $m + 1;
	//	}
	//	if($m > 12){
	//		$m = 1;
	//		$y = $y +1;
	//	}

	$m = $m + intval($d / $day);
	$d = $d % $day;
	if ($d == 0) {
		$d = $day;
		$m = $m - 1;
	}

	if ($m > 12) {
		$m = 1;
		$y = $y + intval($m / 12);
	}
	return $y . '-' . $m . '-' . $d;
}

//$flg = 1->开始日期，$flg = 0 -》 结束日期
function getWeek($s, $i, $flg) {
	$time = explode('-', $s);
	if ($flg) {
		return getYMD($time[0], $time[1], intval($time[2]) + $i * 7);

	} else {
		return getYMD($time[0], $time[1], (intval($time[2]) + 6) + $i * 7);
	}
}



// 团队管理奖
function teamCash($auth,$c){
	
	// VIP
	if($auth == 3){
		if($c < 10){
			
			$m = 0;
			
		}else if($c < 30){
			
			$m = 1500;
			
		}else if($c < 50){
			
			$m = 1500+6000;
			
		}else if($c < 100){
			
			$m = 1500+6000+12500;
			
		}else if($c < 200){
			
			$m = 1500+6000+12500+27000;
			
		}else if($c < 666){
			
			$m = 1500+6000+12500+27000+60000;
			
		}else if($c < 888){
			
			$m = 1500+6000+12500+27000+60000+220000;
			
		}else{
			
			$m = 1500+6000+12500+27000+60000+220000+350000;
			
		}
	}
	
	// 5万合伙人
	if($auth == 2){
		if($c < 10){
			
			$m = 0;
			
		}else if($c < 30){
			
			$m = 2000;
			
		}else if($c < 50){
			
			$m = 2000+8000;
			
		}else if($c < 100){
			
			$m = 2000+8000+15000;
			
		}else if($c < 200){
			
			$m = 2000+8000+15000+40000;
			
		}else if($c < 666){
			
			$m = 2000+8000+15000+40000+90000;
			
		}else if($c < 888){
			
			$m = 2000+8000+15000+40000+90000+300000;
			
		}else{
			
			$m = 2000+8000+15000+40000+90000+300000+500000;
			
		}
	}
	
	return $m;
}
?>