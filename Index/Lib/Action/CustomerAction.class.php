<?php

//
class CustomerAction extends Action
{


    // 首页index
    public function cusList()
    {

        $this->display();
    }

    public function addCus(){
    	
        $custype = M('config')->where("type='khbq'")->select();
        $yblx = M('config')->where("type='yblx'")->select();
    	$jdlx = M('config')->where("type='jdlx'")->select();
    	$user = M('user')->where("staue=1")->select();
        $agentd = M('agent')->where("hzflg=1")->select();

    	$this->assign('custype',$custype)
        ->assign('user',$user)
        ->assign('yblx',$yblx)
        ->assign('jdlx',$jdlx)
        ->assign('agentd',$agentd)
        ->display();
    }

    

   




}