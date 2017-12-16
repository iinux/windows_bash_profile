#!/bin/sh

between_date(){
    datebeg=$1
    dateend=$2
    #read datebeg
    #read dateend
    beg_s=`date -d "$datebeg" +%s`
    end_s=`date -d "$dateend" +%s`
    while [ "$beg_s" -le "$end_s" ]
    do
        date -d @$beg_s +"%Y%m%d"
        beg_s=$((beg_s+86400))
    done
}
#between_date 20170730 20170806

get_cpu(){
    name=$1
    cpu=`wmic path Win32_PerfFormattedData_PerfProc_Process get Name,PercentProcessorTime | grep -i $name | awk '{print $2}'`
    echo $cpu
}

attr_cpu=`get_cpu taskmgr`
if [ $attr_cpu -gt 0 ]; then
    echo 'no'
else
    echo 'ok'
fi
