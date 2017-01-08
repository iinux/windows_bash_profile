<?php
function win_kill($pid){ 
    $wmi=new COM("winmgmts:{impersonationLevel=impersonate}!\\\\.\\root\\cimv2"); 
    $procs=$wmi->ExecQuery("SELECT * FROM Win32_Process WHERE ProcessId='".$pid."'"); 
    foreach($procs as $proc) 
        $proc->Terminate(); 
}
win_kill(23076);
