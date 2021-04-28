<?php

//
class SetAction extends Action
{


    /*
    *
    *数据字典设置模块
    */
    public function setList()
    {

        $this->display();
    }

    // search
    public function setSearch(){
    	$type = I('itype');
    	$c['type'] = $type;
    	$d = M('config')->where($c)->select();

    	$f = array(
            "code"=> 0
	        ,"msg"=>""
	        ,"data"=>$d
        );
        $this->ajaxReturn($f);
    }

    // add
    public function setAdd(){
    	$d['type'] = I('type');
    	$d['value'] = I('value');
    	$d['creattime'] = time();

    	$f = M('config')->add($d);

    	$this->ajaxReturn($f);
    }

    // edit
    public function setEdit(){
    	$c['id'] = I('id');

    	$d = M('config')->where($c)->find();

    	$d['value'] = I('value');

    	$f = M('config')->save($d);

    	$this->ajaxReturn($f);
    }

    // edit
    public function setDel(){
    	$c['id'] = I('id');

    	$f = M('config')->where($c)->delete();

    	

    	$this->ajaxReturn($f);
    }

    /**
    *代理商设置模块
    */

    public function agentList(){

        $d['yblx'] = M('config')->where("type='yblx'")->select();
        $d['jdlx'] = M('config')->where("type='jdlx'")->select();
        
        // var_dump($d);

    	$this->assign('configd',$d)->display();
    }

    // 增加
    public function agentAdd(){
        $d = I('agentd');
        $d['creattime'] = time();
        $d['address'] = $d['province'].$d['city'].$d['area'].$d['addr'];

        $f = M('agent')->add($d);
        $this->ajaxReturn($f);
    }

    // search
    public function agentSearch(){
        
        $d = M('agent')->select();

        $f = array(
            "code"=> 0
            ,"msg"=>""
            ,"data"=>$d
        );
        $this->ajaxReturn($f);
    }
    

    /**
     * 代理商成本模板
     */
    
    // 增加
    public function agentCostAdd(){
        $d = I('agentcostd');
        $d['creattime'] = time();
        

        $f = M('agentcost')->add($d);
        $this->ajaxReturn($f);
    }
    // search
    public function agentCostSearch(){
        
        $c['agentid'] = I('agentid');
        $d = M('agentcost')->where($c)->select();

        $f = array(
            "code"=> 0
            ,"msg"=>""
            ,"data"=>$d
        );
        $this->ajaxReturn($f);
    }

    /**
    *员工设置模块
    */
   
   public function employeeList(){
        $this->display();
    }
   




}