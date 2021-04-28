<?php

//
class EmployeeAction extends Action
{


    // 首页index
    public function index()
    {

        $this->display();
    }

    // search
    public function search(){
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
    public function add(){
    	$d['type'] = I('type');
    	$d['value'] = I('value');
    	$d['creattime'] = time();

    	$f = M('config')->add($d);

    	$this->ajaxReturn($f);
    }

    // edit
    public function edit(){
    	$c['id'] = I('id');

    	$d = M('config')->where($c)->find();

    	$d['value'] = I('value');

    	$f = M('config')->save($d);

    	$this->ajaxReturn($f);
    }

    // edit
    public function del(){
    	$c['id'] = I('id');

    	$f = M('config')->where($c)->delete();

    	

    	$this->ajaxReturn($f);
    }

   




}